Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DFCD4F57
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Sep 2023 10:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC304610A7;
	Fri, 22 Sep 2023 10:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC304610A7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=PRtL7Hu3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cyzLcqDV7dj; Fri, 22 Sep 2023 10:37:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4715760AD0;
	Fri, 22 Sep 2023 10:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4715760AD0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22B79C0039;
	Fri, 22 Sep 2023 10:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2796CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 10:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 096FA60E78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 10:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 096FA60E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUicpclYeEeH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 10:37:13 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A89560AD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 10:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A89560AD0
ARC-Seal: i=1; a=rsa-sha256; t=1695379027; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gTVEPjztewFCN35bG7+dtuXMy47AxDrJwET5aPVGaqDAEvhNjQ53eWilFtedZni2R/6AqEEcey4VN8sLkFRB/nHB75qVEi44VsTaHB/zl02tm97Cofe+GkCvwRy/lmz61ObMFTc3++WZ+ZcOWDVPQhSHJlyqtwZYenYe5aHBFPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1695379027;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WoTf5e6rsMExBp3L8DfEZ2bSdB3f+6PoijVMaG/CS1w=; 
 b=j27HtRGvFk4vWGRzB7olmmFvOQT5vMPdJ/GvUviyGc0nC4yLKXTpnxD0g4ESJoS7Tvpes8RkHf/LBG0cZmkTb7sv+wbhLISZy+78otFlhJgbiWFslh7ztxbW9LWy+UVP1iU6FOahSoFmLDYDWEGuS847wmJqkJyjo1T0RgvBlxY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695379027; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=WoTf5e6rsMExBp3L8DfEZ2bSdB3f+6PoijVMaG/CS1w=;
 b=PRtL7Hu30kgnX/93wuL9Ux8Ed4433CzwMJV0skMg3ghqNgUBMUld+zHL6x44pgiB
 GmR8n3FtGsQOdutwIH6x51xZQ2+dqRxeNStfvAKQrPG4E02PuOpWiCRW0R/UKQwAo99
 4LJDOjIQiwGQ3p9a0JHuluik1FnKNYQCY0jXoLSs=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1695379025621916.7953876971129;
 Fri, 22 Sep 2023 03:37:05 -0700 (PDT)
Date: Fri, 22 Sep 2023 07:37:02 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] sound: usb: increase snd_card alloc size
Message-ID: <tfxcs7kxvkumpv2ngnkelc6bsgggpz3uxdnvjwf6cefmjtliua@li433cj6ymgc>
References: <20230922005152.163640-1-ricardo@marliere.net>
 <87h6nmegt9.wl-tiwai@suse.de> <877coiedwm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877coiedwm.wl-tiwai@suse.de>
X-ZohoMailClient: External
Cc: alsa-devel@alsa-project.org, Sean Young <sean@mess.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com,
 Jaroslav Kysela <perex@perex.cz>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 23/09/22 11:49AM, Takashi Iwai wrote:
> On Fri, 22 Sep 2023 10:46:26 +0200,
> Takashi Iwai wrote:
> > 
> > On Fri, 22 Sep 2023 02:51:53 +0200,
> > Ricardo B. Marliere wrote:
> > > 
> > > Syzbot reports a slab-out-of-bounds read of a snd_card object. When
> > > snd_usb_audio_create calls snd_card_new, it passes sizeof(*chip) as the
> > > extra_size argument, which is not enough in this case.
> > > 
> > > Relevant logs below:
> > > 
> > > BUG: KASAN: slab-out-of-bounds in imon_probe+0x2983/0x3910
> > > Read of size 1 at addr ffff8880436a2c71 by task kworker/1:2/777
> > > (...)
> > > The buggy address belongs to the object at ffff8880436a2000
> > >  which belongs to the cache kmalloc-4k of size 4096
> > > The buggy address is located 1 bytes to the right of
> > >  allocated 3184-byte region [ffff8880436a2000, ffff8880436a2c70)
> > > 
> > > Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.co/m
> > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > > ---
> > >  sound/usb/card.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > index 1b2edc0fd2e9..6578326d33e8 100644
> > > --- a/sound/usb/card.c
> > > +++ b/sound/usb/card.c
> > > @@ -619,7 +619,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
> > >  	}
> > >  
> > >  	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
> > > -			   sizeof(*chip), &card);
> > > +			   sizeof(*chip) + 2, &card);
> > 
> > Sorry, it's no-no.  We have to fix the cause of the OOB access instead
> > of papering over with a random number of increase.
> > 
> > Unfortunately, most important piece of information is trimmed in the
> > changelog, so I can't judge what's going on.  The only useful info
> > there is that it's something to do with imon driver, but it's
> > completely independent from USB-audio.  How does it access to the
> > external memory allocated by snd-usb-audio driver at all?
> > 
> > Before jumping to the solution, we must understand the problem.
> 
> Now I took a look at the syzbot URL and got more info.
> 
> Through a quick glance, my wild guess is that two different drivers
> are bound to two interfaces of the device, the first one to usb-audio
> and the second one to imon.  And imon driver blindly assumes that the
> first interface is bound with imon, too, and that can be the cause.
> A patch like below (totally untested!) might fix the problem.
> 
> Can you reproduce the problem in your side?  Or did you pick this up
> randomly without testing?

Thanks for the valuable info! I tested your proposed patch and it works.
Will you send it as a proper patch or can the maintainers pick it from
here?

> 
> In anyway, let's put media people to Cc.
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -2427,6 +2427,12 @@ static int imon_probe(struct usb_interface *interface,
>  		goto fail;
>  	}
>  
> +	if (first_if->dev.driver != interface->dev.driver) {
> +		dev_err(&interface->dev, "inconsistent driver matching\n");
> +		ret = -EINVAL;
> +		goto fail;
> +	}
> +
>  	if (ifnum == 0) {
>  		ictx = imon_init_intf0(interface, id);
>  		if (!ictx) {

Tested-by: Ricardo B. Marliere <ricardo@marliere.net>


Linux garage 6.6.0-rc2-next-20230921-dirty #15 SMP PREEMPT_DYNAMIC Fri Sep 22 07:29:07 -03 2023 x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Sep 19 21:04:06 UTC 2023 on ttyS0
10:31:03 root@garage ~
# ./syz-execprog repsyz
2023/09/22 10:31:08 parsed 1 programs
[   43.416521][ T8175] cc1plus (8175) used greatest stack depth: 22080 bytes left
[   43.470240][ T8179] cc1plus (8179) used greatest stack depth: 22008 bytes left
[   49.171720][ T8224] Adding 124996k swap on ./swap-file.  Priority:0 extents:23 across:1427660k
[   49.178542][ T8224] syz-executor (8224) used greatest stack depth: 21096 bytes left
2023/09/22 10:31:15 executed programs: 0
[   49.233026][   T55] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > 1
[   49.234270][   T55] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > 9
[   49.235218][   T55] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
[   49.236338][   T55] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
[   49.237283][   T55] Bluetooth: hci0: unexpected cc 0x0c25 length: 249 > 3
[   49.238146][   T55] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
[   49.355885][ T8240] chnl_net:caif_netlink_parms(): no params data found
[   49.395950][ T8240] bridge0: port 1(bridge_slave_0) entered blocking state
[   49.396944][ T8240] bridge0: port 1(bridge_slave_0) entered disabled state
[   49.397714][ T8240] bridge_slave_0: entered allmulticast mode
[   49.398831][ T8240] bridge_slave_0: entered promiscuous mode
[   49.401610][ T8240] bridge0: port 2(bridge_slave_1) entered blocking state
[   49.402380][ T8240] bridge0: port 2(bridge_slave_1) entered disabled state
[   49.403189][ T8240] bridge_slave_1: entered allmulticast mode
[   49.404311][ T8240] bridge_slave_1: entered promiscuous mode
[   49.421315][ T8240] bond0: (slave bond_slave_0): Enslaving as an active interface with an up link
[   49.423376][ T8240] bond0: (slave bond_slave_1): Enslaving as an active interface with an up link
[   49.440902][ T8240] team0: Port device team_slave_0 added
[   49.442592][ T8240] team0: Port device team_slave_1 added
[   49.457205][ T8240] batman_adv: batadv0: Adding interface: batadv_slave_0
[   49.458088][ T8240] batman_adv: batadv0: The MTU of interface batadv_slave_0 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1560 would solve the problem.
[   49.461793][ T8240] batman_adv: batadv0: Not using interface batadv_slave_0 (retrying later): interface not active
[   49.464566][ T8240] batman_adv: batadv0: Adding interface: batadv_slave_1
[   49.465329][ T8240] batman_adv: batadv0: The MTU of interface batadv_slave_1 is too small (1500) to handle the transport of batman-adv packets. Packets going over this interface will be fragmented on layer2 which could impact the performance. Setting the MTU to 1560 would solve the problem.
[   49.468023][ T8240] batman_adv: batadv0: Not using interface batadv_slave_1 (retrying later): interface not active
[   49.491775][ T8240] hsr_slave_0: entered promiscuous mode
[   49.493000][ T8240] hsr_slave_1: entered promiscuous mode
[   49.576424][ T8240] netdevsim netdevsim1 netdevsim0: renamed from eth0
[   49.580029][ T8240] netdevsim netdevsim1 netdevsim1: renamed from eth1
[   49.582870][ T8240] netdevsim netdevsim1 netdevsim2: renamed from eth2
[   49.585559][ T8240] netdevsim netdevsim1 netdevsim3: renamed from eth3
[   49.598460][ T8240] bridge0: port 2(bridge_slave_1) entered blocking state
[   49.599405][ T8240] bridge0: port 2(bridge_slave_1) entered forwarding state
[   49.600596][ T8240] bridge0: port 1(bridge_slave_0) entered blocking state
[   49.601368][ T8240] bridge0: port 1(bridge_slave_0) entered forwarding state
[   49.632834][ T8240] 8021q: adding VLAN 0 to HW filter on device bond0
[   49.638691][   T23] bridge0: port 1(bridge_slave_0) entered disabled state
[   49.651679][   T23] bridge0: port 2(bridge_slave_1) entered disabled state
[   49.656749][ T8240] 8021q: adding VLAN 0 to HW filter on device team0
[   49.661350][   T31] bridge0: port 1(bridge_slave_0) entered blocking state
[   49.662190][   T31] bridge0: port 1(bridge_slave_0) entered forwarding state
[   49.673212][  T765] bridge0: port 2(bridge_slave_1) entered blocking state
[   49.674679][  T765] bridge0: port 2(bridge_slave_1) entered forwarding state
[   49.698632][ T8240] hsr0: Slave A (hsr_slave_0) is not up; please bring it up to get a fully working HSR network
[   49.702458][ T8240] hsr0: Slave B (hsr_slave_1) is not up; please bring it up to get a fully working HSR network
[   49.778155][ T8240] 8021q: adding VLAN 0 to HW filter on device batadv0
[   49.802649][ T8240] veth0_vlan: entered promiscuous mode
[   49.806107][ T8240] veth1_vlan: entered promiscuous mode
[   49.818270][ T8240] veth0_macvtap: entered promiscuous mode
[   49.822124][ T8240] veth1_macvtap: entered promiscuous mode
[   49.829757][ T8240] batman_adv: batadv0: Interface activated: batadv_slave_0
[   49.833955][ T8240] batman_adv: batadv0: Interface activated: batadv_slave_1
[   49.836876][ T8240] netdevsim netdevsim1 netdevsim0: set [1, 0] type 2 family 0 port 6081 - 0
[   49.837861][ T8240] netdevsim netdevsim1 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
[   49.838840][ T8240] netdevsim netdevsim1 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
[   49.840126][ T8240] netdevsim netdevsim1 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[   49.893587][ T8569] wlan0: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[   49.894469][ T8569] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:50
[   49.917314][ T8569] wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
[   49.918127][ T8569] wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
[   49.961690][ T8587] UDC core: USB Raw Gadget: couldn't find an available UDC or it's busy
[   49.965046][ T8587] misc raw-gadget: fail, usb_gadget_register_driver returned -16
[   50.219962][  T765] usb 2-1: new high-speed USB device number 2 using dummy_hcd
[   50.459682][  T765] usb 2-1: Using ep0 maxpacket: 16
[   50.579830][  T765] usb 2-1: config 1 has too many interfaces: 163, using maximum allowed: 32
[   50.581753][  T765] usb 2-1: config 1 has an invalid descriptor of length 7, skipping remainder of the config
[   50.583812][  T765] usb 2-1: config 1 has 3 interfaces, different from the descriptor's value: 163
[   50.585682][  T765] usb 2-1: config 1 interface 1 altsetting 1 endpoint 0x1 has an invalid bInterval 0, changing to 7
[   50.587870][  T765] usb 2-1: config 1 interface 1 altsetting 1 endpoint 0x1 has invalid wMaxPacketSize 0
[   50.590104][  T765] usb 2-1: too many endpoints for config 1 interface 2 altsetting 0: 128, using maximum allowed: 30
[   50.592292][  T765] usb 2-1: config 1 interface 2 altsetting 0 has 0 endpoint descriptors, different from the interface descriptor's value: 128
[   50.594921][  T765] usb 2-1: config 1 interface 2 altsetting 1 endpoint 0x82 has an invalid bInterval 62, changing to 7
[   50.597128][  T765] usb 2-1: config 1 interface 2 altsetting 1 endpoint 0x82 has invalid maxpacket 41992, setting to 1024
[   50.749794][  T765] usb 2-1: New USB device found, idVendor=15c2, idProduct=0039, bcdDevice=80.f3
[   50.751765][  T765] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   50.753415][  T765] usb 2-1: Product: syz
[   50.754255][  T765] usb 2-1: Manufacturer: syz
[   50.755247][  T765] usb 2-1: SerialNumber: syz
[   50.805761][  T765] imon:imon_find_endpoints: no valid input (IR) endpoint found
[   50.807506][  T765] imon 2-1:1.0: unable to initialize intf0, err -19
[   50.808934][  T765] imon:imon_probe: failed to initialize context!
[   50.810288][  T765] imon 2-1:1.0: unable to register, err -19
[   51.069921][  T765] usb 2-1: 2:1 : UAC_AS_GENERAL descriptor not found
[   51.113716][  T765] imon 2-1:1.1: inconsistent driver matching
[   51.121438][  T765] imon 2-1:1.1: unable to register, err -22
[   51.122866][  T765] imon: probe of 2-1:1.1 failed with error -22
[   51.132274][  T765] usb 2-1: USB disconnect, device number 2
[   51.270491][ T4485] Bluetooth: hci0: command 0x0409 tx timeout
10:31:17 root@garage ~
# 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
