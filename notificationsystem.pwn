#include <a_samp>
#include <cef>
#include <Pawn.CMD>

#define BROWSER_ID 0x12346

main(){}

forward OnGameModeInit();
public OnGameModeInit()
{
    cef_subscribe("send:action:notificar", "Notificar");
    return 1;
}

forward OnPlayerSpawn(playerid);
public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);

    //CEF
    cef_create_browser(playerid, BROWSER_ID, "http://localhost/NotificationSystem/index.html", false, false);
    return 1;
}

Notificar(playerid, type[100], title[100], message[100], time)
{
    cef_emit_event(playerid, "send:action:notificar", CEFSTR(type), CEFSTR(title), CEFSTR(message), CEFINT(time));
}

// EXEMPLO DE COMO CRIAR UMA NOTIFICAÇÃO
cmd:teste(playerid)
{
    Notificar(playerid, "geral", "Titulo", "Mensagem aqui", 2000);
    Notificar(playerid, "info", "Titulo", "Mensagem aqui", 2000);
    Notificar(playerid, "sucesso", "Titulo", "Mensagem aqui", 2000);
    Notificar(playerid, "erro", "Titulo", "Mensagem aqui", 2000);
    Notificar(playerid, "aviso", "Titulo", "Mensagem aqui", 2000);
    Notificar(playerid, "sms", "Titulo", "Mensagem aqui", 2000);
    return 1;
}