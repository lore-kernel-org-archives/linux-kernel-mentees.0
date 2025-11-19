Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C8301038
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571802; cv=none; b=AhcsnC2nFOWedxcFdmY2A724wBlav3B3sQiqwhRJNSFYQTMYzM/LC/fs7WcPK+E4F62qEPVjNWpe+fCzybQC12vGrqrRUlAYPcg3wdpoWSyiZ+hG/mAV5AYVQSozCkdzOqS+LBafq7uXxV0I5hoD2hx0ZCTyjlUINP5Ol0L+4Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571802; c=relaxed/simple;
	bh=VEQxhRQzksqQnHbDBTAG8PHofzw31luJF8BTCh2+4lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dtgfuna2iFvaBjm/8SQmslt0XsdIZPJCHpLFbOKRXurZ0vTG3H8LE+oQQ02dJwpKBfHeO9GvwZB1LLjoJYNFCw4Dim4lL7gzodhSry6phHrXK98P3yJa4IOtLRFiZhCXrwESy1oELo7Cp7/n5StYFDm4ciRTg+PnQdu7XYevrwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ev9tyO+x; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ev9tyO+x"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A2140358
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLMsv2ZT3djE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 17:03:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E40D64003D
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E40D64003D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ev9tyO+x
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E40D64003D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 17:03:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b71397df721so1048974566b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 09:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763571791; x=1764176591; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Aq7SoQkDPefXTnydjjfdctowbfsVatqatQ/Cb6wzSc=;
        b=ev9tyO+x1hWtF13PuF1r2aYc5c3OEtQ3BPru8lxVgDpXg/Ga5MnsYzVaTtaW0rL+ST
         biOaQsddXulTjlxHLyQ6ab+AkpFjiDJEVey648sl+EIrTygBje9Z5dwnRTly728Ji6RW
         RIsgkC5e37hWvm34k7IsWZt+/RpE5hILP0YekbadkdmaJoXZ1zO5OYqrhvkorNvXkmlZ
         xNXQvt2GNF+3nJi6ROwj9suL9tZo+RDtsvs+7T3WWZf7pf7QIV8M69eC2fPigvdcLMXl
         8IUKba0lZ3PrsJ6L29eOFS0ubz91U9HcaGsQ05YrfNePoDwWTJ2o+2dB8ioGPvsdGmUq
         XAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571791; x=1764176591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Aq7SoQkDPefXTnydjjfdctowbfsVatqatQ/Cb6wzSc=;
        b=ANHb7o0azAp1A7epVdeQu3+s2mFLQ7w0+kyJ2Xz/KM3vfNFPo01lmMbul5EyPK3Ujo
         AF4q4uccIZjKmIELVQbZ1QTVWjH1W7zXgU+vsf6aeJENO1RXcTj+Uk7m8Au7hVh1hY5A
         fMnKrR62+nt35FprMdkb6Pb5MGWWxgR8rQReHfUlwewztaD7w5S7zobPPUyBHikXB4+M
         tKBet8xgyGpr6Iz3HNb2oKgOoB+RGaKUyivwPgOqQlgCVUmI9Y1jeTL1SOyL+eUjX+HE
         3g9Cx/xXtnnBZTLvT6PX1PktgRSdgpq0XJ+ziIdoPX3ppN5XDbUcEWHqllOSD4HLwcWw
         BePg==
X-Forwarded-Encrypted: i=1; AJvYcCUqYyjR8CA4cICXQkUBEiuoEYzfMleKKn4STo7UeAuSfCfS7RZP0TxFerAYbScfGuHlCN4DVcRDBmToYxDS/bHBz4s/Kg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzxCxyCimjfKtndkjT72U8WCyhoSem5/n4WfXQtsxBz2ZchdzIB
	9rZDmtVaG5Le3KRXC/FES4OP7A7fHAQWVrNN1rD2Pyxg27iHfZ/jj5WC2tnqSLKHWdc=
X-Gm-Gg: ASbGncuVfx1/6Q5/DbPXQI0Zs5CwHtGK+rUCclfxtQ11evT5SkFyiHuME0542krC1CQ
	UmEGL2HdfcL8ImV77PH6LyBkiTIW+fCz8Njn9mCDuAKKviP6EWiqwXK98G3t9L7zr2cDnZV/M1g
	SKkg43QNeQYfivw8iScC6Mott/MRdTpSItQ+KZOLeB5rJ1G3Bia4OejKV6lpOkKEkt7+MyPtKSv
	wVSQaGHBl1xkhmAoP16ltQewu6jLiwyjR51lfzDGIcDPKbkpfCmpYK8wvYXUWcrZzZDsNlBmNP6
	nCGvR17Qlqx2l6weQGLHqwiJs/Tc4kB27QkE8eU4/UYgA9SfZMqkNdC9+hvvm5d2FWW9G0nRzrx
	VSJYsp+lLCKvXYooaZTyxJt+TVaCH9A7iEx6UqXITUD4Bj8ciSdlAHq8bV+Zci210S9r9OsJCrD
	gsMxGWUVWCIjOLnpSg0VhxkJU=
X-Google-Smtp-Source: AGHT+IHNG0xR2Nj78a6qtdjpZdZDZ5RfLZiNVmgkDjdRpL+nRMJfSXaidAcitRE0u5t4Gn8M0gkc9Q==
X-Received: by 2002:a17:907:2d0e:b0:b73:9fea:330a with SMTP id a640c23a62f3a-b739fea3954mr1260508666b.17.1763571790991;
        Wed, 19 Nov 2025 09:03:10 -0800 (PST)
Received: from FV6GYCPJ69 ([213.195.231.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed90c0sm1680149666b.65.2025.11.19.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:03:10 -0800 (PST)
Date: Wed, 19 Nov 2025 18:03:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net] team: Move team device type change at the end of
 team_port_add
Message-ID: <admyw5vnd3hup26xew7yxfwqo4ypr5sfb3esk7spv4jx3yqpxu@g47iffagagah>
References: <20251112003444.2465-1-zlatistiv@gmail.com>
 <c6fa0160-aac6-4fc4-b252-7151a0cb91d3@redhat.com>
 <mekjl7qqrb6nkk6ru4fztqxzemldzbsplf5tzuu7amc7yaa5j3@rulh6ijsppaq>
 <vv54er56wgnehntr2zh5jk6iz5s36jpyi4jfwjnkfabfwithtl@aizn2anzknjm>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vv54er56wgnehntr2zh5jk6iz5s36jpyi4jfwjnkfabfwithtl@aizn2anzknjm>

Wed, Nov 19, 2025 at 05:24:37PM +0100, zlatistiv@gmail.com wrote:
>On Wed, Nov 19, 2025 at 05:10:15PM +0100, Jiri Pirko wrote:
>> Tue, Nov 18, 2025 at 12:46:36PM +0100, pabeni@redhat.com wrote:
>> >On 11/12/25 1:34 AM, Nikola Z. Ivanov wrote:
>> >> @@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>> >>  		}
>> >>  	}
>> >>  
>> >> +	err = team_dev_type_check_change(dev, port_dev);
>> >> +	if (err)
>> >> +		goto err_set_dev_type;
>> >
>> >Please don't add unneeded new labels, instead reuse the exiting
>> >`err_set_slave_promisc`.
>> 
>> Well, that is how error labels are done in team. "action" and
>> "err_action" is always paired. Why to break this consistent pattern?
>
>Hi Jiri,
>
>This pattern is already broken in the same function by this:
>
>        /* set promiscuity level to new slave */
>        if (dev->flags & IFF_PROMISC) {
>                err = dev_set_promiscuity(port_dev, 1);
>                if (err)
>                        goto err_set_slave_promisc;
>        }
>
>        /* set allmulti level to new slave */
>        if (dev->flags & IFF_ALLMULTI) {
>                err = dev_set_allmulti(port_dev, 1);
>                if (err) {
>                        if (dev->flags & IFF_PROMISC)
>                                dev_set_promiscuity(port_dev, -1);
>                        goto err_set_slave_promisc;
>                }
>        }
>
>So I guess I should also "break" it or do it as you've just
>suggested and add another label "err_set_slave_allmulti"
>so that we are at least consistent with this.

:( I think it would be fine to fix it, by another patch targetting
   net-next tree. Thanks!

>
>Thank you!
