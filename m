Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FED2F261F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763577433; cv=none; b=VBn3YF1cDYqfRsG28mYucv59fsfxzFAstwNgbmdvL/iZTrBVqVCN55BtICSr44zhl/g8ct2nNMt8nVzjTH57c5/FdnzcYU/p1SDLzk7uokicziS3URzdyNXIU5z/A0bAzt/xtI4U6VkZvDdLSJr8WocSsCV63h38L//5q2K52w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763577433; c=relaxed/simple;
	bh=Pljqk6pAVQfOEBJUscF9umbyJ32Tb6yQgcNpGLXNkIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3AwUK9zquavxwoNBDjzWzEwQcn4Srij9A0dr0WEJVjPFGUcKjSlrVvGuiSNqp+/OwRWSM9pKT01Jw3NLRhKu/1/qH8imY6HjcFqhj4AjJFEF58GxJMIgnGoyB51p/ceYZI4N23NDxDo6gA6cTmw1ufl9OuhIvk5qOil3ZZE5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J86G9hnj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J86G9hnj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A2FB6063E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 18:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9Fv33tbO9UP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 18:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56A8D61115
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A8D61115
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J86G9hnj
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 56A8D61115
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 18:37:02 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b762de65c07so12765666b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763577420; x=1764182220; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lf9Cg4Wp0k7y8UsSPnR61aZnXKwNvPdWd+HUA2UGWGU=;
        b=J86G9hnjyH0s6vadzbZPeuMpF/lzC+zFEafc2qmEWHWLP5aY+OUYDwn5ii/sE+0O1E
         HBoGJyr4Atru0zw/PjvG1Mhg1E4rhdAFneSDrOdT19xtBfBRGcOaRcicfqSPzVEx2tFs
         OhJnWrHwA2hBfOXpL8Mp1CDgQypfKYQcOlROVK/VPHk7WiHQUTQWna2m5QmGEuqidpi4
         NV6F0y38tq4CgdEz5Zu/nCvTmzy7OIz6LQXT870hapGAj+n/CmSCTONTeJZ0SNLodsI5
         clFRARTYKCUtNjnJt0dBPz8Cjf2n+HTZlSTkCeFZvF+bB5HhbkQg6WEO7TqJi7/kxm5G
         smeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763577420; x=1764182220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf9Cg4Wp0k7y8UsSPnR61aZnXKwNvPdWd+HUA2UGWGU=;
        b=SzDtKNJHMpOJNj+/Mfw87x1nFdX9QkDVIBEtM1MUPQX7fwtyD976M7LXD0irSmIXGU
         WON9B68ipLaR7r1Ri7q41nXkoC2fWCcrvwB0MyWGVH1JiWt6Nc7NZpB3GuUJmykzglWS
         S6lKYx/weVBTrudO+53ygyTNC4+FZ5AuhKPisdgXQjXQCAiodSzSkVVXJfW67N8j8EwQ
         FkxqczG3qROsawwUh1s2qOPVIe1MCWTQtAdKkFKieUM6dVIDWZoMHsOEqbCN7FnB8mdr
         aFHLTTYia+iutxhz43xYi5RBE1WhPCIBHU7FFEIkxsZsE4gwDCPzIPhlmcbqWhkjBiq9
         VvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhduuvLxcvOJJYX3BDsM7cWh4SYmrOx/i3sPHtBw2riO4kiBUP55vu0sMqvhw/XJl2TqBcWyci3D7Jf7fF4gbLSAfVaA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/6adT5WIWyPWPNLiRbLMcPKMl2LUMoJcUHleew0UhY4UtPcTK
	foazIVaAhBOGtsEvxs2K/lzIGrptjgq6O2azuj02UfnI/xp/030CQSvP
X-Gm-Gg: ASbGncukLn62kgoL6cV07ljXQXVVkhzkEgutsw1afF0gpu51uH0NEVtu5WgkTrRivDr
	8+/f118xhaEffC7nWzUl6XZdBhHIfk/eTUpV4UyLDfznxKZaPhJdng8p4Os46Sfb5W46jxKEunD
	cIRTGQoiJPFr0xf0BNVgyZZG8P5j5vj2sI2A2sGq9r5NYTz1E9x7Y35+nDyVFNvs0h5dE0Rdepd
	o4JfldF/URIwxPzV3TmugGcnznsh/S8CDXfMzBalmbJMFpWgb1kxctcAuwgHuDLbQQ51+49c1Ei
	VfOR0md3KHFbc5/KZ5k15U5poZA6bJbLEx6frND5oi41/CPIOXhO1kVw6PXN2XfOga5tJzPgexs
	L5bRj/9XOn15NoZE9pq8NNWc7czqhu7L+XCrBWqTthCBnI6z3uk/+B+bZSpqJAgdrQ1GzpgrqDI
	vkVPEljXlKUXba3kI48ykvWeT1VdJXpBEe
X-Google-Smtp-Source: AGHT+IEjSObOUyY2ZIHcGf7HOqmJrPfEdO5JLEkjTsbFK8Y2A4HZ4NxmmbPrWEcm/MGQHqwjnAgQFg==
X-Received: by 2002:a17:906:9f96:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b7654f9fd70mr12377466b.36.1763577419947;
        Wed, 19 Nov 2025 10:36:59 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d54cf2sm8142966b.18.2025.11.19.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:36:59 -0800 (PST)
Date: Wed, 19 Nov 2025 20:36:57 +0200
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] team: Move team device type change at the end of
 team_port_add
Message-ID: <kpcqanotwzhukk6oemmopw77m5v6lvbubikmk6gotfmwhezbnq@ofz2e2zq4mot>
References: <20251113211142.245216-1-zlatistiv@gmail.com>
 <gbashnabbmnsqwwno5rc4piiwkluriytfcnvfdejn4abwovfkl@furcaobquk5t>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gbashnabbmnsqwwno5rc4piiwkluriytfcnvfdejn4abwovfkl@furcaobquk5t>

On Wed, Nov 19, 2025 at 05:51:42PM +0100, Jiri Pirko wrote:
> Thu, Nov 13, 2025 at 10:11:42PM +0100, zlatistiv@gmail.com wrote:
> >Attempting to add a port device that is already up will expectedly fail,
> >but not before modifying the team device header_ops.
> >
> >In the case of the syzbot reproducer the gre0 device is
> >already in state UP when it attempts to add it as a
> >port device of team0, this fails but before that
> >header_ops->create of team0 is changed from eth_header to ipgre_header
> >in the call to team_dev_type_check_change.
> >
> >Later when we end up in ipgre_header() struct *ip_tunnel points to nonsense
> >as the private data of the device still holds a struct team.
> >
> >Example sequence of iproute commands to reproduce the hang/BUG():
> >ip link add dev team0 type team
> >ip link add dev gre0 type gre
> >ip link set dev gre0 up
> >ip link set dev gre0 master team0
> >ip link set dev team0 up
> >ping -I team0 1.1.1.1
> >
> >Move team_dev_type_check_change down where all other checks have passed
> >as it changes the dev type with no way to restore it in case
> >one of the checks that follow it fail.
> >
> >Also make sure to preserve the origial mtu assignment:
> >  - If port_dev is not the same type as dev, dev takes mtu from port_dev
> >  - If port_dev is the same type as dev, port_dev takes mtu from dev
> >
> >Testing:
> >  - team device driver in-tree selftests
> >  - Add/remove various devices as slaves of team device
> >  - syzbot
> >
> >Reported-by: syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
> >Closes: https://syzkaller.appspot.com/bug?extid=a2a3b519de727b0f7903
> >Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
> >Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> >---
> >Changes since v1:
> >  - Add a "Fixes" tag
> >  - Add a simple reproducer in the commit log
> >  https://lore.kernel.org/netdev/20251111171341.4c6d69be@kernel.org/T/#u
> >
> > drivers/net/team/team_core.c | 19 +++++++++++--------
> > 1 file changed, 11 insertions(+), 8 deletions(-)
> >
> >diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
> >index 29dc04c299a3..94c149e89231 100644
> >--- a/drivers/net/team/team_core.c
> >+++ b/drivers/net/team/team_core.c
> >@@ -1134,10 +1134,6 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> > 		return -EPERM;
> > 	}
> > 
> >-	err = team_dev_type_check_change(dev, port_dev);
> >-	if (err)
> >-		return err;
> >-
> > 	if (port_dev->flags & IFF_UP) {
> > 		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it as a team port");
> > 		netdev_err(dev, "Device %s is up. Set it down before adding it as a team port\n",
> >@@ -1155,10 +1151,12 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> > 	INIT_LIST_HEAD(&port->qom_list);
> > 
> > 	port->orig.mtu = port_dev->mtu;
> >-	err = dev_set_mtu(port_dev, dev->mtu);
> >-	if (err) {
> >-		netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
> >-		goto err_set_mtu;
> >+	if (dev->type == port_dev->type) {
> >+		err = dev_set_mtu(port_dev, dev->mtu);
> 
> I'm probably missing something. Why you made this conditional? Didn't
> find mentioning that in patch description.
> 

Hi Jiri,

This is related to keeping the original MTU assignment logic.

Basically I see 2 cases:

if dev->type == port_dev->type then team_dev_type_check_change will
do nothing and dev_set_mtu will later assign port_dev->mtu = dev->mtu

if dev->type != port_dev->type then team_dev_type_check_change will
assign dev->mtu = port_dev->mtu and dev_set_mtu will do nothing
as they will already be the same.

Now since the patch moves the call to team_dev_type_check_change
past dev_set_mtu it changes this logic.

The conditional is there to maintain the original behavior.

If necessary I can update the commit log to address this in
more detail.

> 
> 
> >+		if (err) {
> >+			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
> >+			goto err_set_mtu;
> >+		}
> > 	}
> > 
> > 	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
> >@@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> > 		}
> > 	}
> > 
> >+	err = team_dev_type_check_change(dev, port_dev);
> >+	if (err)
> >+		goto err_set_dev_type;
> >+
> > 	if (dev->flags & IFF_UP) {
> > 		netif_addr_lock_bh(dev);
> > 		dev_uc_sync_multiple(port_dev, dev);
> >@@ -1251,6 +1253,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> > 
> > 	return 0;
> > 
> >+err_set_dev_type:
> > err_set_slave_promisc:
> > 	__team_option_inst_del_port(team, port);
> > 
> >-- 
> >2.51.0
> >
