Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74215369202
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569485; cv=none; b=E8DgbV5OVUGNFsec/3ulzdUUUyarStuU5to1G20TWm8NYG8Sgt3dlZPeXcYUm+R34ypht6Sxz1RIZ2bwfwuFkQo7lZCRv5JQ50d0fiOZQweWniogBrbetJUbePBo2Lfd88OuX1uuEMjc8bDKBE6cLccdYkewh5myW84gnsiMxHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569485; c=relaxed/simple;
	bh=UUiLN5PsGhbk/UslXZY/UEJEemNxtVPnF9dd1BorKkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWy3Ob8rMXLGAOpHjXDlnVpwyzfYPaPHKhiliDWwskraogWVr8Hby9L9sGrgnHyTBmETtrKWfvPiSJS+ekli1od3EWkz3bje1roE+qf/lumLsyglts1AFUqhDMcczDByyjtOmu760Gq40uvvNhrMc/hDDPZPdafXe++5918qHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx59jQ/J; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx59jQ/J"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AD96081C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7-CLguYXvU4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 16:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D20D607E2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D20D607E2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rx59jQ/J
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D20D607E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:24:42 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b7370698a8eso755271466b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 08:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763569480; x=1764174280; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3N9ErNANzGGwfgeY1v7mT4M/wDvg0ygAOwvykoq3xY=;
        b=Rx59jQ/J8ZHLTNHE2YNr7y/KpcCrVhvlLOGvwxyF16EgLrUezARKtS/gDva6nb26mg
         buBEVOYQnm/c8O5FPpzULJd1B8QaVx03BuPlEt0OW6QnT8Mu6ZibXXNwJGJmYyKrGZAf
         Nj/x/nn3fD08DBXI7H4W/gcpfRSQPfR/hVM3IC8zRUzP94u4gV3DVpSiusdNe/cRLV/Q
         cMxVb/X6duC3Ak16MF6N60obhWE5z6lwlwqn6zhC+04VRT6CuoHVn8zGKBOAxXU4LkCJ
         IXlrj9UaE3j1sPb/rCnZUlegiS6RSC28IvORhYt5cQQ4TX2I6mhR2PWZF2t6vWeKGDYT
         ujkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569480; x=1764174280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3N9ErNANzGGwfgeY1v7mT4M/wDvg0ygAOwvykoq3xY=;
        b=ZxKqp8QKZdaNS3G5jN6jnHFzefutXWFHs5irvBtdOgqaqVhQ4tLtZ14kTYJW3ksfSr
         1uXAZ1HLTdgt1ZmKx/HplT61ST1ByweXLDmEs5JPxVI3THwxFpKxvQRct99rjdVL0OSz
         Mama6erSH5my6uCTCyF+dkfVxEaexcXDC3GYxPVwLYBx03NqKyMs2iIl15SY9HMCWJCN
         jdp+wYG3jao75GclYAVRTbp4dZK5FouuUXArxJDjtCc/qoHybdWpJS0ooMeJTEEcokvJ
         g7vqlr3bBiLtafbj9tF3W69MSktpVYV3rLbNiAefDjn5/GoiT9vkhAtMM+84w0gyaROw
         6CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHkGEM+ewhCZxNG/HkF9RqGclgMlDrpBh/ikMVBj/Sj6LvffDJ3mKPuxJ6jIH4RMCZsBBFwkIa3Zwj2y1cvWeq5/zKaA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzkk2oIS24V1RlAKyWdTpZq7KUpoUzNdAyiyxP3V/R5ipHR58z7
	GKsWuTZxD0ssBF9GOToG/Nyvdyo8ZwUH3IQ8Qdv5CCvXTQIBjtcUgpDp
X-Gm-Gg: ASbGncsNNsGgMJ9YbXiuA5FV1uVV2tplid17b9hTNf8JG5NEVHYNxu/XPJVaUESmRh0
	HnHd9nlEqqmX53VjOYCvNeywye59sIYWmGHRP6NR8u1oL+tBX3H1JoUXRAIz9AmiAgfFA7Poqf9
	BeBZ+ZUieplcLrVpy4g2KdPvYwizm4raA+wx6CpFi1u7SrTyLDQe7DLRHQ00XDeMdQq1l8tCoFk
	WeQ+tyW5d6l2tU2OucbRHZGudxzrOUVOVfTCi1E2kgee26o2gDk5vzMSs46x7seGZOVnHFCHDVG
	LiS0czF/qTX1yPC5x+GrmTJf2er4ArbmutrptPr4ij9j4RAO8BNqIxXPVrLIfW1LQEK8p9Azioq
	j/66B3fkZY/ZUrYisI5M3IewkQFDqjucgpnh+XO/J19DjqsVWb7W985D2QFpSW0apWW4QBKsdfa
	qr2+GP9IRBkvXh1ym4wHBJbw==
X-Google-Smtp-Source: AGHT+IEhDRw4dV8UjCbRWVY4aY/eenqpiZBRwRmszWkO7M5Mr++PemeK3uIbC0+zEzuxM0+Ytez6Zw==
X-Received: by 2002:a17:907:7f02:b0:b73:9be1:33ec with SMTP id a640c23a62f3a-b739be13868mr1255076266b.9.1763569480058;
        Wed, 19 Nov 2025 08:24:40 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1639328366b.70.2025.11.19.08.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:24:39 -0800 (PST)
Date: Wed, 19 Nov 2025 18:24:37 +0200
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Paolo Abeni <pabeni@redhat.com>, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net] team: Move team device type change at the end of
 team_port_add
Message-ID: <vv54er56wgnehntr2zh5jk6iz5s36jpyi4jfwjnkfabfwithtl@aizn2anzknjm>
References: <20251112003444.2465-1-zlatistiv@gmail.com>
 <c6fa0160-aac6-4fc4-b252-7151a0cb91d3@redhat.com>
 <mekjl7qqrb6nkk6ru4fztqxzemldzbsplf5tzuu7amc7yaa5j3@rulh6ijsppaq>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mekjl7qqrb6nkk6ru4fztqxzemldzbsplf5tzuu7amc7yaa5j3@rulh6ijsppaq>

On Wed, Nov 19, 2025 at 05:10:15PM +0100, Jiri Pirko wrote:
> Tue, Nov 18, 2025 at 12:46:36PM +0100, pabeni@redhat.com wrote:
> >On 11/12/25 1:34 AM, Nikola Z. Ivanov wrote:
> >> @@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
> >>  		}
> >>  	}
> >>  
> >> +	err = team_dev_type_check_change(dev, port_dev);
> >> +	if (err)
> >> +		goto err_set_dev_type;
> >
> >Please don't add unneeded new labels, instead reuse the exiting
> >`err_set_slave_promisc`.
> 
> Well, that is how error labels are done in team. "action" and
> "err_action" is always paired. Why to break this consistent pattern?

Hi Jiri,

This pattern is already broken in the same function by this:

        /* set promiscuity level to new slave */
        if (dev->flags & IFF_PROMISC) {
                err = dev_set_promiscuity(port_dev, 1);
                if (err)
                        goto err_set_slave_promisc;
        }

        /* set allmulti level to new slave */
        if (dev->flags & IFF_ALLMULTI) {
                err = dev_set_allmulti(port_dev, 1);
                if (err) {
                        if (dev->flags & IFF_PROMISC)
                                dev_set_promiscuity(port_dev, -1);
                        goto err_set_slave_promisc;
                }
        }

So I guess I should also "break" it or do it as you've just
suggested and add another label "err_set_slave_allmulti"
so that we are at least consistent with this.

Thank you!
