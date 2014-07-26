class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :developer_project
  has_many :developers, :through => :developer_project

  using SerializeSymbol

  before_save :initialize_status

  validates_presence_of :title, :repository, :description, :status
  validates :status, :inclusion => [ :requested, :in_progress, :finished ]

  serialize :status, Symbol

  def status= new_stat
    super(new_stat.to_sym)
  end
  
  private

    def initialize_status
      self.status = :requested
    end

end
