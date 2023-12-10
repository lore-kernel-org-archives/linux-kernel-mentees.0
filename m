Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3719818C03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1QI3R5g"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C22260B73
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 17:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C22260B73
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L1QI3R5g
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vydBzOFSPwJ8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Dec 2023 17:44:28 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9940660B6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 17:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9940660B6C
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d1e1edb10bso34077815ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 09:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702230268; x=1702835068; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SS1+OVcRNomKHQX5A4fgIMvgK+UxWWAQ3wRRF1rhvuE=;
        b=L1QI3R5gEaL7HNklBK8WxXoF9skQwYYDjvoVzYuxf/zpWKaShqNNkntYt7WH0Q7eQe
         KIsaSZApKo4HzhIb5XQMwFVd4wW+kXNOjC7q5MVtjM6/jXJXFBXu7801blBEuzUw2cCc
         Cfj5Zi+6MYKzx2PQciNZb/5rjN5JKcd5LARNxx/YfjsvFF4L1DNvgUoZbJV0+3iODG2r
         zdOpmaND4iA0D6iz8GCkuCTfmxg5jec5uxDXcR9UwMfMKJx8MXMP6qL8xVlGpXF+gbxe
         aYX/isaDdJGw4Yh4inyYwwdr8EttQ7EHQe1DCVcVJnlFffoTjxxsROgWBoe+qaQ4E91F
         WY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702230268; x=1702835068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS1+OVcRNomKHQX5A4fgIMvgK+UxWWAQ3wRRF1rhvuE=;
        b=CaxVzookS1AvLIAitBDZJTfv9dUHXp2xsElWcebOeI4YPxHdlDxXXYN70xmQuIHegq
         7z56GrofklRkRrehq18txgTVo9nRk8GbaYxs+atdUunx66T4k83rEoGTWnAX8JtYZ3V/
         8sXZrVa7mVhQ2w8zIaVovqTLBH1yQmMJ7X+ODnBd3HRIsxHdgNPuL4VC/nox+2BTHNkE
         xFjHjI1rVoGhYFZPIigR7Wzq97UhYIEx8Z4gaMcWQnMTC9ngrn0oabzJi2FFAFge2SuA
         U4AD0XfHXrpdWDmfbd6AGCMY9S8P6SGBK3sRM15be3h7lir36bC41xe1UUh2Wa0cQ7PG
         euCw==
X-Gm-Message-State: AOJu0YypRR40ggnVQZI3oq6ancFsjNL6i7/LYDmCh/XcAA1MmpjOdD3E
	Iov97BIxyRhXXGmnfouEgyU=
X-Google-Smtp-Source: AGHT+IEhF96xvo6Xnp1QVoczPAt+WLXoaEfAplAdMoxSob7xeDJzlmD+JZ56b+Ee55a/ToSSI8RsIA==
X-Received: by 2002:a17:902:f690:b0:1d0:c502:e0b3 with SMTP id l16-20020a170902f69000b001d0c502e0b3mr3734235plg.36.1702230267783;
        Sun, 10 Dec 2023 09:44:27 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.80.2])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902a70d00b001cf6453b237sm5015101plq.236.2023.12.10.09.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 09:44:27 -0800 (PST)
Date: Sun, 10 Dec 2023 23:14:21 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXX49ULoUPOznKhP@swarup-virtual-machine>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
 <20231205191944.6738deb7@kernel.org>
 <ZXAoGhUnBFzQxD0f@nanopsycho>
 <20231206080611.4ba32142@kernel.org>
 <ZXNgrTDRd+nFa1Ad@swarup-virtual-machine>
 <ZXWlTYyPF0nj1wof@nanopsycho>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXWlTYyPF0nj1wof@nanopsycho>

On Sun, Dec 10, 2023 at 12:47:25PM +0100, Jiri Pirko wrote:
> Fri, Dec 08, 2023 at 07:30:05PM CET, swarupkotikalapudi@gmail.com wrote:
> >On Wed, Dec 06, 2023 at 08:06:11AM -0800, Jakub Kicinski wrote:
> >> On Wed, 6 Dec 2023 08:51:54 +0100 Jiri Pirko wrote:
> >> > My "suggested-by" is probably fine as I suggested Swarup to make the patch :)
> >> 
> >> Ah, I didn't realize, sorry :) Just mine needs to go then.
> >
> >Hi Jiri,
> >
> >Please find answer for some quesion from you.
> >
> >1. I removed the Fixes tag.
> >
> >2. I removed Jakub's name from Suggested-by tag.
> >
> >3. I added new line as suggested.
> >
> >   value: ## or number, is used only if there is a gap or
> >   missing attribute just above of any attribute which is not yet filled.    
> >
> >4. dl-attr-stats has a value 0 as shown below for this reason:
> >    name: dl-attr-stats
> >    name-prefix: devlink-attr-
> >    attributes:
> >      - name: stats-rx-packets
> >        type: u64
> >        value: 0 <-- 0 is added here due to below mentioned reason
> >                     but mainly to match order of stats unnamed enum declared in include/uapi/linux/devlink.h
> 
> So, by default, it starts with 1?
>
Hi Jiri,

Yes it seems by default it starts with 1
e.g. below is test result when value is not added

git diff Documentation/netlink/specs/devlink.yaml
diff --git a/Documentation/netlink/specs/devlink.yaml b/Documentation/netlink/specs/devlink.yaml
index c3a438197964..9d0e684da574 100644
--- a/Documentation/netlink/specs/devlink.yaml
+++ b/Documentation/netlink/specs/devlink.yaml
@@ -1191,7 +1191,6 @@ attribute-sets:
     attributes:
       - name: stats-rx-packets
         type: u64
-        value: 0
       -
         name: stats-rx-bytes
         type: u64

sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/devlink.yaml --do trap-get --json '{"bus-name": "netdevsim", "dev-name": "netdevsim1", "trap-name": "ttl_value_is_too_small"}' --process-unknown
{'bus-name': 'netdevsim',
 'dev-name': 'netdevsim1',
 'stats': {'UnknownAttr(0)': b'iW*\x00\x00\x00\x00\x00',
           'stats-rx-bytes': 62,
           'stats-rx-packets': 394034238},
 'trap-action': 'trap',
 'trap-generic': True,
 'trap-group-name': 'l3_exceptions',
 'trap-metadata': {'trap-metadata-type-in-port': True},
 'trap-name': 'ttl_value_is_too_small',
 'trap-type': 'exception'}

Thanks,
Swarup


 
> 
> >      -
> >        name: stats-rx-bytes
> >        type: u64
> >      -
> >        name: stats-rx-dropped
> >        type: u64
