# Destroy existing data
MaintenanceTicket.destroy_all
Property.destroy_all
Opportunity.destroy_all

# Properties with enhanced details and images
p1 = Property.create!(
  name: "Ocean View Villa", 
  address: "Calle de la Playa 123", 
  city: "Málaga",
  square_meters: 250,
  coordinates: "36.7213,-4.4214",
  image_url: "/images/ocean_view_villa.png",
  purchase_price: 450000, 
  current_value: 520000, 
  occupancy_rate: 0.92, 
  monthly_net_income: 3800, 
  airbnb_score: 4.9
)

p2 = Property.create!(
  name: "Modern Downtown Loft", 
  address: "Avenida Central 45", 
  city: "Madrid",
  square_meters: 85,
  coordinates: "40.4168,-3.7038",
  image_url: "/images/modern_loft.png",
  purchase_price: 280000, 
  current_value: 310000, 
  occupancy_rate: 0.85, 
  monthly_net_income: 2100, 
  airbnb_score: 4.7
)

p3 = Property.create!(
  name: "Retiro Urbano", 
  address: "Calle Silencio 7", 
  city: "Barcelona",
  square_meters: 120,
  coordinates: "41.3851,2.1734",
  image_url: "/images/retiro_urbano.png",
  purchase_price: 600000, 
  current_value: 750000, 
  occupancy_rate: 0.98, 
  monthly_net_income: 5200, 
  airbnb_score: 4.95
)

# Maintenance Tickets
MaintenanceTicket.create!(title: "Renovación Baño Suite", description: "Cambio de azulejos y grifería premium para aumentar tarifa diaria.", status: "approved", budget: 4500, capex: true, property: p1)
MaintenanceTicket.create!(title: "Reparación Aire Acondicionado", description: "Mantenimiento preventivo anual.", status: "completed", budget: 250, capex: false, property: p2)

# Opportunities
Opportunity.create!(title: "Solar en Costa del Sol", description: "Terreno listo para desarrollo de 4 villas de lujo.", price: 1200000, projected_roi: 18.5, category: "Desarrollo")
Opportunity.create!(title: "Portfolio 3 Apartamentos Centro", description: "Unidades ya en gestión con histórico demostrable.", price: 850000, projected_roi: 7.2, category: "Renta Variable")
