Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40953314DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640763; cv=none; b=OeQ/g3FjtdbQvIKmKuJ+0yzh184scKbDdBgQurJbcE1KN3+A72X7YkfW3FUeAmuGsljKuRB/Opv8UxwnVwmEfWHSLyFCTogkl7d0cylYBhT4LPVA7CtI7+9v/bWo2ZwMuUurH2DkJGZu/g+35eLSu5CJkA8gsLNoNM7YFu2QWn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640763; c=relaxed/simple;
	bh=BRyQWGJjMOz8YXDkOmuCC5ztvh9GiLQSmG54+91Ic0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR7YktSrymqSdXwO4fBuwu2a29cA+7xomGj8joqwk1Z0SXjUfWOpEp0lPkH8stSl4kuU7IktQ1V4RcKgqHUDg2/ht4AHSjOtE0hkjY3nWjtOGUs8jD06PYBWv1EBsK0RoxDZEF9HyLKvvF8+kildPRH/whQybU3upFMBM8xhlv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=lFeYJwuz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="lFeYJwuz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5F741003
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 12:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_GUXyd08UeW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Nov 2025 12:12:40 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EBCE41000
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EBCE41000
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=lFeYJwuz
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6EBCE41000
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 12:12:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so1349327a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 04:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763640755; x=1764245555; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igQkL0hwJSy+45hU8sboipK524syNZD4LXwpNdIPlK4=;
        b=lFeYJwuziytljiB2j+uPZetQVv2/clI5RVVMwTUKHuUdG29+Kb43YjtSldEy1Q0S4g
         6YJeYQzrDAFLgJKWJnC+WdhoLytrDKWyhgTrgI1/dBWsUh87IQOSBfy/w3/4ruYuishy
         QIPIjM/jwMZWtxJlP2OlhgduPZm1mRLOh5hKSxu2/KRUUynX43Ir8nFXQ3hHGBSRx5kx
         kSg4L6cN8QalhbiDz9kQTKNa8nq9Ypy1NpKiJfr3Q0bIgmXIbWhHOech8eR3S7tv2w/X
         LtgkAyVshWW4GCDhZJ1LSeCjSjct4NPs1YRRUb3T/h5fZlNlLu2SzwP5HiRFh33sCNz2
         HXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640755; x=1764245555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igQkL0hwJSy+45hU8sboipK524syNZD4LXwpNdIPlK4=;
        b=tHYcif9V6v9G2Y8Rww1xNbQ4WC+J6z/hzx+iply+ZjzbUC+q9PhCuQUDO69p/mclv0
         aasSc0+lAhP1OKboMRHJIHCk2JajrNBJTdmpu91bNfXeXY8u9hdVEG6Q9sYNpRd/8Y9s
         968LxzxATGiVq/4fsBkam6kvyEkjqMq1KRo95PvxlAfit1UzZYIR0tNIAU5G85Eu8ENQ
         CtSpyhtdxume7kpTRWLTw0Zy7MgE26J8awYJ2SQ3Emhom4ntEsZvKQ+gw95xe4CAUn7E
         n7jpknczBBNyxlPMiCoMZcZSJc1Zzr9P6UmCjNzR6WCA+Or14eriGfDw/6hYwMV6YLuz
         f8uA==
X-Forwarded-Encrypted: i=1; AJvYcCW5MJTGJ8wtmS7K8nXLO7oWPcvtreprlPjqMXJlz2R7rJOqE8PPzXC+ZJREJZTwnfOxaSfDwynTcLufyAgjkpoq372fDA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxB8U+YBiFBVXQLC8GXeWLx0tt6j0UCPIKpmGR3CkdXL9qZfZni
	Mv2p1ftpjbkAYiX9FdUhrxMVd2bS1n2CbtL3Ywyt19ycG268IPllcVB0C62P/pxsEio=
X-Gm-Gg: ASbGncvYKxqiGcggAL9HlK/5NvRmwgj+zHGmnV3i6k+o4fbwVMjwFjQ3tNYHIf0hxZV
	h4d6gr8hhmFkaDTRL+80xpoF/mEGk+qVDNhg0gbvX8UF1EIFyOCFW3Oh+LRyKnQmLyzXhZv15K0
	6YFof09PXjHn0nYMIY2Ik3UrmB6UMtJutCsdoT9oPpqeWsqn9ZCGJRMNALgb5OlCzkAz2KHjoiD
	TPMM4kL9RAMcuYx01/5MSqzbvIizaYh5cUi8oQ1Kw2fdUS1jRqOLkKP5YbBOt1nx4hn1cOaedZK
	YV4oQRx+oF02B/HPA6MDXwCnnWTORqu8clAaz793Yc7FLnEon+0zynE8sYNeQLrzZLhSJSb/J9F
	k0n8PHpv0ulrD282G+In0fHUbOV4rjkcbMoGPLX+VCKExAfnBUDQ/I7O4ydxDkv7c+j2tlkvg2G
	1e7H5NnxThbP/KSYwiRNs=
X-Google-Smtp-Source: AGHT+IHEfjUDRSw3XsIoCGUJfKvzP1sM+MewmjFxvo0sdFUq9/jwQ57RTX6W6E/9W3zN5+Kf9XtZqg==
X-Received: by 2002:a05:6402:3549:b0:63f:d245:aec4 with SMTP id 4fb4d7f45d1cf-64536467e18mr3136529a12.32.1763640755390;
        Thu, 20 Nov 2025 04:12:35 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536442993sm2075212a12.27.2025.11.20.04.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:12:34 -0800 (PST)
Date: Thu, 20 Nov 2025 13:12:33 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] team: Move team device type change at the end of
 team_port_add
Message-ID: <tdtkaqqlfivf4r4wxgoztv6ogzmp4dprbcz32psoj2sbtgphkg@bvwiovmnxtgi>
References: <20251113211142.245216-1-zlatistiv@gmail.com>
 <gbashnabbmnsqwwno5rc4piiwkluriytfcnvfdejn4abwovfkl@furcaobquk5t>
 <kpcqanotwzhukk6oemmopw77m5v6lvbubikmk6gotfmwhezbnq@ofz2e2zq4mot>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kpcqanotwzhukk6oemmopw77m5v6lvbubikmk6gotfmwhezbnq@ofz2e2zq4mot>

Wed, Nov 19, 2025 at 07:36:57PM +0100, zlatistiv@gmail.com wrote:
>On Wed, Nov 19, 2025 at 05:51:42PM +0100, Jiri Pirko wrote:
>> Thu, Nov 13, 2025 at 10:11:42PM +0100, zlatistiv@gmail.com wrote:
>> >Attempting to add a port device that is already up will expectedly fail,
>> >but not before modifying the team device header_ops.
>> >
>> >In the case of the syzbot reproducer the gre0 device is
>> >already in state UP when it attempts to add it as a
>> >port device of team0, this fails but before that
>> >header_ops->create of team0 is changed from eth_header to ipgre_header
>> >in the call to team_dev_type_check_change.
>> >
>> >Later when we end up in ipgre_header() struct *ip_tunnel points to nonsense
>> >as the private data of the device still holds a struct team.
>> >
>> >Example sequence of iproute commands to reproduce the hang/BUG():
>> >ip link add dev team0 type team
>> >ip link add dev gre0 type gre
>> >ip link set dev gre0 up
>> >ip link set dev gre0 master team0
>> >ip link set dev team0 up
>> >ping -I team0 1.1.1.1
>> >
>> >Move team_dev_type_check_change down where all other checks have passed
>> >as it changes the dev type with no way to restore it in case
>> >one of the checks that follow it fail.
>> >
>> >Also make sure to preserve the origial mtu assignment:
>> >  - If port_dev is not the same type as dev, dev takes mtu from port_dev
>> >  - If port_dev is the same type as dev, port_dev takes mtu from dev
>> >
>> >Testing:
>> >  - team device driver in-tree selftests
>> >  - Add/remove various devices as slaves of team device
>> >  - syzbot
>> >
>> >Reported-by: syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
>> >Closes: https://syzkaller.appspot.com/bug?extid=a2a3b519de727b0f7903
>> >Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
>> >Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>> >---
>> >Changes since v1:
>> >  - Add a "Fixes" tag
>> >  - Add a simple reproducer in the commit log
>> >  https://lore.kernel.org/netdev/20251111171341.4c6d69be@kernel.org/T/#u
>> >
>> > drivers/net/team/team_core.c | 19 +++++++++++--------
>> > 1 file changed, 11 insertions(+), 8 deletions(-)
>> >
>> >diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
>> >index 29dc04c299a3..94c149e89231 100644
>> >--- a/drivers/net/team/team_core.c
>> >+++ b/drivers/net/team/team_core.c
>> >@@ -1134,10 +1134,6 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>> > 		return -EPERM;
>> > 	}
>> > 
>> >-	err = team_dev_type_check_change(dev, port_dev);
>> >-	if (err)
>> >-		return err;
>> >-
>> > 	if (port_dev->flags & IFF_UP) {
>> > 		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it as a team port");
>> > 		netdev_err(dev, "Device %s is up. Set it down before adding it as a team port\n",
>> >@@ -1155,10 +1151,12 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>> > 	INIT_LIST_HEAD(&port->qom_list);
>> > 
>> > 	port->orig.mtu = port_dev->mtu;
>> >-	err = dev_set_mtu(port_dev, dev->mtu);
>> >-	if (err) {
>> >-		netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
>> >-		goto err_set_mtu;
>> >+	if (dev->type == port_dev->type) {
>> >+		err = dev_set_mtu(port_dev, dev->mtu);
>> 
>> I'm probably missing something. Why you made this conditional? Didn't
>> find mentioning that in patch description.
>> 
>
>Hi Jiri,
>
>This is related to keeping the original MTU assignment logic.
>
>Basically I see 2 cases:
>
>if dev->type == port_dev->type then team_dev_type_check_change will
>do nothing and dev_set_mtu will later assign port_dev->mtu = dev->mtu
>
>if dev->type != port_dev->type then team_dev_type_check_change will
>assign dev->mtu = port_dev->mtu and dev_set_mtu will do nothing
>as they will already be the same.
>
>Now since the patch moves the call to team_dev_type_check_change
>past dev_set_mtu it changes this logic.
>
>The conditional is there to maintain the original behavior.
>
>If necessary I can update the commit log to address this in
>more detail.

Please do. Also, a brief comment at this check in the code it self would
be certainly nice for the reader.

Thanks!


>
>> 
>> 
>> >+		if (err) {
>> >+			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
>> >+			goto err_set_mtu;
>> >+		}
>> > 	}
>> > 
>> > 	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
>> >@@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>> > 		}
>> > 	}
>> > 
>> >+	err = team_dev_type_check_change(dev, port_dev);
>> >+	if (err)
>> >+		goto err_set_dev_type;
>> >+
>> > 	if (dev->flags & IFF_UP) {
>> > 		netif_addr_lock_bh(dev);
>> > 		dev_uc_sync_multiple(port_dev, dev);
>> >@@ -1251,6 +1253,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>> > 
>> > 	return 0;
>> > 
>> >+err_set_dev_type:
>> > err_set_slave_promisc:
>> > 	__team_option_inst_del_port(team, port);
>> > 
>> >-- 
>> >2.51.0
>> >
