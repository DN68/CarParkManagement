package fa.training.repository;

import fa.training.entity.Ticket;

import java.util.List;

public interface TicketRepository {
    public List<Ticket>  getListTicket(int page, int non, int typeSearch, String txtSearch);
    public int getAllTicketTotal(int typeSearch, String txtSearch);
    public boolean deleteTicket(int ticket_id);
    public boolean addTicket(Ticket ticket);
    public Ticket getTicketById(int ticket_id);
//    public int getTripId(int ticket_id);
//    public String getLicense(int ticket_id);
    public boolean updateTicket(Ticket ticket);
}
