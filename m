Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71204171A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R8OuiL9h"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3EE4174D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 09:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3EE4174D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R8OuiL9h
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdbDKA0qGOIi
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 14 Nov 2023 09:45:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 16DC94173F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 09:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16DC94173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699955130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HHbZ3HpNA5nuHEYXQosZHzK1INPecuQojCAvIxpZEc=;
	b=R8OuiL9h9L0olbBAugyRgvqiBbmR81bH0g3sa2xN/2LjyQdqKGKQsMy0USyeDhT0rroW4P
	2W9DPQH6mFuJ5ndyRuwaxuFZP1L91Hj86RxF3MFChNNKHpeDDNE0QT4c29V/QFoDunrFXk
	yV0DhcmIHQvvhymegiWeCY2c02/QRuo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-0ZzlAbnGNIKjMLsII2R9GA-1; Tue, 14 Nov 2023 04:45:29 -0500
X-MC-Unique: 0ZzlAbnGNIKjMLsII2R9GA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9bfbc393c43so83057566b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 01:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699955128; x=1700559928;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HHbZ3HpNA5nuHEYXQosZHzK1INPecuQojCAvIxpZEc=;
        b=DipRc0OkX7vY5AJhm0i/wrY4SOtQ04KtoYzLmKRS8U2AOyFxqUVI81jmJ7k/EO1hLN
         UFIPmPVKFBuIghszqyUezauHVMAiKjvOC6YWqxyTi3u0gng8vH/3XOLgcZzJBq1IfslX
         AZteM88hNECqDmwI/2FpKmvsMxHWUPO/GR1MovCB6B31A9YpQKS8ZhRwB85KjYcbiA7x
         4nZ/jeCW/4jT37w+b9JBIugBwRg56+a5FT1R8bidOL9XZ7AtAx0zj0YyXShl+WucFV7L
         VVHej9kWiISteSgwqZl52bgAFaI54MC/hcDxE/ZRUKyucTAKR4iOtHZvkh20LGd9To3+
         BfgA==
X-Gm-Message-State: AOJu0YxnWa84gsvKkGKRNZTZRkuI5j4thn57zUFP0FzZ3QhN0RnqQSy+
	xFhyfn8jTdTuhnMptJdNgoUz6mqFAzWz3yiQLCFODm1SCTjaZ/+HYnLVtGbTWJxYNMo9y5IkHdh
	b1Cy2xCQonAZNRdpyz2NhJfHDYWjvtLEfe4jxaNmWPEHDLuge
X-Received: by 2002:a17:906:5197:b0:9e5:fa52:f229 with SMTP id y23-20020a170906519700b009e5fa52f229mr1007786ejk.5.1699955125394;
        Tue, 14 Nov 2023 01:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/fAfgQU8HAIn2EGvjaAD+qeySLqRzs98nZop+a0VLt9DHEDhk5xI3LgV8QHyTRJMy0e7hcA==
X-Received: by 2002:a17:906:5197:b0:9e5:fa52:f229 with SMTP id y23-20020a170906519700b009e5fa52f229mr1007769ejk.5.1699955124998;
        Tue, 14 Nov 2023 01:45:24 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-230-91.dyn.eolo.it. [146.241.230.91])
        by smtp.gmail.com with ESMTPSA id ox2-20020a170907100200b009e5ded7d090sm5285727ejb.97.2023.11.14.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 01:45:24 -0800 (PST)
Message-ID: <0d902d2b15ef44e9e0157d8012c42347ffeec86e.camel@redhat.com>
Subject: Re: [PATCH] netlink: specs: devlink: add missing attributes in
 devlink.yaml and re-generate the related code
From: Paolo Abeni <pabeni@redhat.com>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 jiri@resnulli.us,  netdev@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Date: Tue, 14 Nov 2023 10:45:23 +0100
In-Reply-To: <20231113063904.22179-1-swarupkotikalapudi@gmail.com>
References: <20231113063904.22179-1-swarupkotikalapudi@gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-11-13 at 12:09 +0530, Swarup Laxman Kotiaklapudi wrote:
> Add missing attributes in devlink.yaml.
>=20
> Re-generate the related devlink-user.[ch] code.
>=20
> trap-get command prints nested attributes.
>=20
> Test result with trap-get command:
>=20
> sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/devlink.ya=
ml
> --do trap-get --json '{"bus-name": "netdevsim", "dev-name": "netdevsim1",
> "trap-name": "ttl_value_is_too_small"}' --process-unknown
>=20
> {'attr-stats': {'rx-bytes': 30931292, 'rx-dropped': 87,
>  'rx-packets': 217826},
>  'bus-name': 'netdevsim',
>  'dev-name': 'netdevsim1',
>  'trap-action': 'trap',
>  'trap-generic': True,
>  'trap-group-name': 'l3_exceptions',
>  'trap-metadata': {'metadata-type-in-port': True},
>  'trap-name': 'ttl_value_is_too_small',
>  'trap-type': 'exception'}
>=20
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> Suggested-by: Jiri Pirko <jiri@resnulli.us>

Please insert the target tree in the subj prefix (in this case 'net-
next')

Does not apply cleanly to net-next, please rebase it.=20

Thanks,

Paolo

