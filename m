Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749812FE04D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571112; cv=none; b=ShkhvEqrKLiui80qwRKZ2RtEifLrPhJiO2Ngw030tJupQd64Hpczy9A4HIeFx8tnYXLMa0X3mkVfnBcnvbKma7R96iVeIZKn84OioxvnpTEkri99Gbhzdcb9AN+xEQ0n78T7sg37Gc3y/tPxHzExqQ/IC+VEvZFFtZs6el7TPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571112; c=relaxed/simple;
	bh=9N1sUiO5CeMoefLRcd5UKkK7JgP2YFmRoYgJ+RGvCRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwaCfFtOHbDVzxXM8DLCuP+gWGQAM2e+9rfw33gABzR6FLc2MkMoeqaCw9lmrDUsdqIox+u/CQyKr5CB7OtpnufzwcGd+iKRfQdWt/vO2XH09e5uK+H59SjmPeX31zU+WY7I1ltMFocBgn0dCW8Eoi7IIH91Bol0TePVOqO08+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ng7c1CrN; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ng7c1CrN"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D46D411BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaYO2cDnpy_o for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 16:51:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D163411AD
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D163411AD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ng7c1CrN
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2D163411AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:51:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b728a43e410so1150621766b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763571104; x=1764175904; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ReEEmWGIWZkShqG3AnUB9jXISOu1RTm6ECnZ2pbpzpw=;
        b=ng7c1CrN3SndzJKkVsqtswYibZ8IuxrQBEopZOpFTCVl8HKR1BL47/seFG/Xfm/8bx
         v+mf8keHOPz5use2B0sf9aC5i+CQEhRQzc/BWjVfQc7mg4i33Q68H1Et2+WVw+FhJ7gZ
         3gO/PY+cZu6+pd3z2VP/3VqG0FpW+4Mds4lZ5hwuHZq1el/HBAzAKBg6bNRIpKkPgAaF
         eaIasy5/M7FQsO6PnnHZNInnR/FJfNUNsCQzlbNw6S4RIX+DOVfOGM2X2LgNvoJFEsSN
         EJxnC2efzmSG7RdGKImV3sDTSI/EN9uZlwxoYb0em7YcbJF5pJ759lHQ9lF8tpbUk4Fy
         2/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571104; x=1764175904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReEEmWGIWZkShqG3AnUB9jXISOu1RTm6ECnZ2pbpzpw=;
        b=DAoYFalQtxpiKVMyTPvnhwpefEEJDItSKq6Ly74Gg/FKBZEMzR4aOwZkdxxIXuSwsU
         McAcDVoqDeybzzK0PIvy4nOSl1t2ZNrw7eEuYRt/n5sazzerIjbWwOIGuwtgmDYpbRTR
         PQZmEAdy/q2q2bApnIno1kypW4FRjr6oyPqRBiOy/pMk2QPqCEidIOLKmHs3+MElWwj8
         /1qQJ6VtuLJr/H5XxAQR71T14siS0Ggg/5/99TCDgTgdtzePvuCsSPkrRzthK/llvnaP
         k1quJvecZvo0ZPuVGfdkx7b6VM4xj6oQEQkmLdfYBd16QcQpHZZRMcyD/E/MXE42XOjY
         t1YA==
X-Forwarded-Encrypted: i=1; AJvYcCUMZWsGAtCQ8ORmfo1ulu7CLwXKJr4ly1/lRA+3ckIZlai1eD/DqNSWFV427+jZUvshjWLib7DHwAlyXcxoM1scCmE0MQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YylayZDVNOimYm6TxuJJARjb33rzmzflyDrSZ3s9iNNAdnHjjkO
	H+Vur7SSZ5waonrW4j+JWMxAB0cP4Gbbz4EnQnxwjnjCa2uF+2vkrNGA6EJIkhttkhk=
X-Gm-Gg: ASbGncvbMOAG31QIjB2UzvvN4imYCfdeiMfOwB99vix0qyePLrUja7Lgs2M5+7/VhoM
	RK0YVD0SCKXD8eVZq3YBiEAsL64gnXtTdmxqauR84oceqSxsCAkxUxI2simxzANmN7VvMhatxLj
	dxIiC99TnFJ/xI5SvhkswVCCLXq859Y5v/LXP/7ONxvDj7MwGkklrubRmEGA7wpRrtIlhi3Zpwv
	FU3RIHbyGUUHBhgGcLRRh4hKsiMULOyjhse+DcoQZUJqegFZ41rEyyP+4VD8f/LLLsgbUjGy61I
	kCYhnfosSCbKyEWryV7xz4QtrihjmdTLWXvshAEI8ix44O1gVXhJ0LIsW8WBqBMjpwAzpKJ1SWO
	7SmuGaOOo/Wtmjef1DK8TyV+83pDhg/RzUkvosnpBQTtEiW/jIqFURRfBAlonZEalxYu+ZBsUjC
	KU8QqAJfyetQWoBopRap1GbWhzoR2TQ22q3g==
X-Google-Smtp-Source: AGHT+IEzLMBCDRHwKO55KVT8oJ8QExhciJCThHZS9S9CuM3yQ83u3ZpN76rvKWx3vuw9CcSdP1Sv/g==
X-Received: by 2002:a17:907:3c90:b0:b73:4006:1883 with SMTP id a640c23a62f3a-b7367b8d6d5mr2014953066b.30.1763571104042;
        Wed, 19 Nov 2025 08:51:44 -0800 (PST)
Received: from FV6GYCPJ69 ([213.195.231.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm1643091266b.31.2025.11.19.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:51:43 -0800 (PST)
Date: Wed, 19 Nov 2025 17:51:42 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] team: Move team device type change at the end of
 team_port_add
Message-ID: <gbashnabbmnsqwwno5rc4piiwkluriytfcnvfdejn4abwovfkl@furcaobquk5t>
References: <20251113211142.245216-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113211142.245216-1-zlatistiv@gmail.com>

Thu, Nov 13, 2025 at 10:11:42PM +0100, zlatistiv@gmail.com wrote:
>Attempting to add a port device that is already up will expectedly fail,
>but not before modifying the team device header_ops.
>
>In the case of the syzbot reproducer the gre0 device is
>already in state UP when it attempts to add it as a
>port device of team0, this fails but before that
>header_ops->create of team0 is changed from eth_header to ipgre_header
>in the call to team_dev_type_check_change.
>
>Later when we end up in ipgre_header() struct *ip_tunnel points to nonsense
>as the private data of the device still holds a struct team.
>
>Example sequence of iproute commands to reproduce the hang/BUG():
>ip link add dev team0 type team
>ip link add dev gre0 type gre
>ip link set dev gre0 up
>ip link set dev gre0 master team0
>ip link set dev team0 up
>ping -I team0 1.1.1.1
>
>Move team_dev_type_check_change down where all other checks have passed
>as it changes the dev type with no way to restore it in case
>one of the checks that follow it fail.
>
>Also make sure to preserve the origial mtu assignment:
>  - If port_dev is not the same type as dev, dev takes mtu from port_dev
>  - If port_dev is the same type as dev, port_dev takes mtu from dev
>
>Testing:
>  - team device driver in-tree selftests
>  - Add/remove various devices as slaves of team device
>  - syzbot
>
>Reported-by: syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=a2a3b519de727b0f7903
>Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
>Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>---
>Changes since v1:
>  - Add a "Fixes" tag
>  - Add a simple reproducer in the commit log
>  https://lore.kernel.org/netdev/20251111171341.4c6d69be@kernel.org/T/#u
>
> drivers/net/team/team_core.c | 19 +++++++++++--------
> 1 file changed, 11 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
>index 29dc04c299a3..94c149e89231 100644
>--- a/drivers/net/team/team_core.c
>+++ b/drivers/net/team/team_core.c
>@@ -1134,10 +1134,6 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> 		return -EPERM;
> 	}
> 
>-	err = team_dev_type_check_change(dev, port_dev);
>-	if (err)
>-		return err;
>-
> 	if (port_dev->flags & IFF_UP) {
> 		NL_SET_ERR_MSG(extack, "Device is up. Set it down before adding it as a team port");
> 		netdev_err(dev, "Device %s is up. Set it down before adding it as a team port\n",
>@@ -1155,10 +1151,12 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> 	INIT_LIST_HEAD(&port->qom_list);
> 
> 	port->orig.mtu = port_dev->mtu;
>-	err = dev_set_mtu(port_dev, dev->mtu);
>-	if (err) {
>-		netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
>-		goto err_set_mtu;
>+	if (dev->type == port_dev->type) {
>+		err = dev_set_mtu(port_dev, dev->mtu);

I'm probably missing something. Why you made this conditional? Didn't
find mentioning that in patch description.



>+		if (err) {
>+			netdev_dbg(dev, "Error %d calling dev_set_mtu\n", err);
>+			goto err_set_mtu;
>+		}
> 	}
> 
> 	memcpy(port->orig.dev_addr, port_dev->dev_addr, port_dev->addr_len);
>@@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> 		}
> 	}
> 
>+	err = team_dev_type_check_change(dev, port_dev);
>+	if (err)
>+		goto err_set_dev_type;
>+
> 	if (dev->flags & IFF_UP) {
> 		netif_addr_lock_bh(dev);
> 		dev_uc_sync_multiple(port_dev, dev);
>@@ -1251,6 +1253,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> 
> 	return 0;
> 
>+err_set_dev_type:
> err_set_slave_promisc:
> 	__team_option_inst_del_port(team, port);
> 
>-- 
>2.51.0
>
