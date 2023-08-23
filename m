Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E1FC3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Aug 2023 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9615760C11;
	Wed, 23 Aug 2023 19:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9615760C11
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q7c+th06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1bohzdNRP6v; Wed, 23 Aug 2023 19:40:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 362D260AC0;
	Wed, 23 Aug 2023 19:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362D260AC0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E680C0039;
	Wed, 23 Aug 2023 19:40:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50392C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E6D40888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E6D40888
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q7c+th06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2AraRQXJ4ZF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:40:31 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5A5B4087E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A5B4087E
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fee769fd53so40815985e9.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692819629; x=1693424429;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZSBOiLjL7l4F5q6riFKLA/ZyFchhCDJyrcaJS20FpE=;
 b=Q7c+th06liDrGKX59Uzi5rXxttPg1iqISxM15+Jq+aB0TfOeh4bkBa2ZLINqjE7wWX
 jCNS0fAxlK1BQvlLtPDPOYVxFHLOCtEw2y51RwVfRaDWJWGsJx1IhZTYZliINrNXV1yU
 RTWRAT5xEfOgO96iBgkdvT2Ovhd/rTrLH0MNCJN08op1yL0yhfqtC6gJMaLjxgdurNSh
 FrJGFt5IakrtZJZ+zS3pOETgKN4f5uyvYNJ/yUrv6XSQyKQvsl2fmUPuZ8RGj75dJa/Z
 juGJHUwVpfpSWhJfXUha7lIDJtPl0V5In9oz6iLERTSi/czSVBdKPN+7HZC5OtUdK1g6
 P0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692819629; x=1693424429;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SZSBOiLjL7l4F5q6riFKLA/ZyFchhCDJyrcaJS20FpE=;
 b=MnlfwYQksLBweYo3rojH6wO+LZkYA+WXkj1651WyMHehe0iFYNwldAQTbpAOzHPOin
 nlQ3nZVVNXi7y8LUnV/cixsngvXm+1KMBDZP76D3fYUxf/0ewLixEdnXJlQyenPsI5+r
 z0/GNlhIz+dEU7XEDRs+fxy/WeG0/TIbRfEEJlMQxvNR21wG/emwXRsKZiv9dPFPr7Xd
 92iWtDPEYDbc2xksMPouAd7Hj4bUbO7u4NFgE21RjHeoSmNS7VwH0c6mpbeB7iWdJ3tD
 Q3HFFvdSeyLC8VIMz7kAbKGBkP7DsqTxwxuebaJ1ZjWZWY/N4LDRgl2a2gUMUDqrwmcx
 uuQA==
X-Gm-Message-State: AOJu0YyKXT7k0MHwcFr23ZEXA2P6dJ2riZxUDjWyFu1dldthfa9iAhdz
 5FGwSkTJdimkfjFwUKp6qjU=
X-Google-Smtp-Source: AGHT+IFzQqUZNW2Ms4UX0ii01iwiE4BupQm9WH+y8SjsIil3cZMc3ISo746anHc7lRrm7ibTKpTnyA==
X-Received: by 2002:a05:600c:d8:b0:3fe:e812:4709 with SMTP id
 u24-20020a05600c00d800b003fee8124709mr9585282wmm.12.1692819628516; 
 Wed, 23 Aug 2023 12:40:28 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:806e:99f3:c946:a43c:e1e3])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a7bca54000000b003fe3674bb39sm503196wml.2.2023.08.23.12.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 12:40:28 -0700 (PDT)
Date: Wed, 23 Aug 2023 23:40:23 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH 2/2] selftests/net: replace ternary operator with
 min()/max()
Message-ID: <20230823194023.zc3p6g2atwjz6hbp@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 pabeni@redhat.com, edumazet@google.com, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-3-mahmoudmatook.mm@gmail.com>
 <64e22ce99cfa6_35801629446@willemb.c.googlers.com.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64e22ce99cfa6_35801629446@willemb.c.googlers.com.notmuch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 08/20, Willem de Bruijn wrote:

> Mahmoud Maatuq wrote:
> > Fix the following coccicheck warning:
> > tools/testing/selftests/net/udpgso_bench_tx.c:297:18-19: WARNING opportunity for min()
> > tools/testing/selftests/net/udpgso_bench_tx.c:354:27-28: WARNING opportunity for min()
> > tools/testing/selftests/net/so_txtime.c:129:24-26: WARNING opportunity for max()
> > tools/testing/selftests/net/so_txtime.c:96:30-31: WARNING opportunity for max()
> > 
> > Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> > ---
> >  tools/testing/selftests/net/Makefile          | 2 ++
> >  tools/testing/selftests/net/so_txtime.c       | 7 ++++---
> >  tools/testing/selftests/net/udpgso_bench_tx.c | 6 +++---
> >  3 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> > index 7f3ab2a93ed6..a06cc25489f9 100644
> > --- a/tools/testing/selftests/net/Makefile
> > +++ b/tools/testing/selftests/net/Makefile
> > @@ -3,6 +3,8 @@
> >  
> >  CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
> >  CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
> > +# Additional include paths needed by kselftest.h
> > +CFLAGS += -I../
> 
> Why this, instead of the existing include with relative path?
>
no big reason other than that version was added in a previous patch that was accepted 
https://lore.kernel.org/all/168972782004.15840.17484255346823026.git-patchwork-notify@kernel.org/#r
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
