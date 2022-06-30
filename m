Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDC5C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jun 2022 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 275A240B1A;
	Thu, 30 Jun 2022 16:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 275A240B1A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VIFAbWG/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRxftA9XUpiO; Thu, 30 Jun 2022 16:09:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3D7BA40533;
	Thu, 30 Jun 2022 16:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7BA40533
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18F34C0021;
	Thu, 30 Jun 2022 16:09:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C1C8C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 16:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27F5C42427
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 16:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F5C42427
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VIFAbWG/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2v2mqnmK-Ter
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 16:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C5241BEE
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C5241BEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 16:09:49 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b2so480312pfb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KwsSHKLHRHeZ0d5jA7PWaCGAaPUqT4/TqEpXIIwB1VY=;
 b=VIFAbWG/kO4gzWSlyJ9yQgKHfRV/ICX1iG9a/ei94noNZzpa9U/dWDAe9JSWDUBRoh
 qy9T486Wu3Q4nLrNRiQNa1HrCjqw99DJbxlKTzkgix/osKU5IYKhpiE5KRKq6Xyj8laA
 cevib/mnKf6TB6lMjzCR55DT1LOMc6jsF8RM3vrlTKmdzYALB2EMuwU6gGsTiFDdjWHQ
 eTI8x8gXst8QHFIgZANgIEiBRWs1SOfm6Nk+QjZWCKDOUomUuvd3rXybh/NV1MpDOnbE
 kBA/UERHkSIv5Fwm/GKXG5xuSkOIblaIlg6HjnYSAq8pR4n1KGR1TONZNkvLWdyorhJz
 GN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KwsSHKLHRHeZ0d5jA7PWaCGAaPUqT4/TqEpXIIwB1VY=;
 b=IWGe4nP2BFY+1e1YjCwnKQWCnNhKXF5Z1Ic5pSkB90oTVOnpTGPxff902j9Xp+Dutw
 HOd/NcMye9TP0T+L+Y54g50EFQmyTfSZFkQ+hrILHmUi+cOnMloGoomYkd7LCSfxf5Zg
 nAgKDOezoEIDFYLPWglxPoqFp20k9ZYjQ7NFsAQozw6Tpfuwevp2hqwWetTDb5Vo7n5f
 Wpfkg8nNVAQe5kNkMfTDkpZW/JCExiAF5sAFFHbu7TRVBhKD9+KjOqg21A7StZ4LeRNc
 TguqHEmj7gmulph3l47Bb4trfvX4u05J8+gZ8g443ZYL6+q/m6glo41tj0cJZQCzRqGK
 22dA==
X-Gm-Message-State: AJIora9kKf41miYha7mjzdGGBsjH9zCbqpQNzFosZ4S+bbsZDlQ0W0dr
 NDp0PzWh/z6fWB7Y58bvSEMk4/3w8CcniY4y7cAc4Q==
X-Google-Smtp-Source: AGRyM1sMsMYRLHKnhpVNZxh9qvjcZFmYSohiiYSVMmKD5eVHyVENMkBfA55O3jSOPBloWV3IOQ/IOA==
X-Received: by 2002:a65:684c:0:b0:411:b3d3:a7f7 with SMTP id
 q12-20020a65684c000000b00411b3d3a7f7mr2083847pgt.448.1656605389072; 
 Thu, 30 Jun 2022 09:09:49 -0700 (PDT)
Received: from praghadeesh ([2409:4072:6d1a:bac4:80b2:d21d:c273:e2aa])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a17090b078400b001ec92575e83sm4715815pjz.4.2022.06.30.09.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 09:09:48 -0700 (PDT)
Date: Thu, 30 Jun 2022 21:39:41 +0530
From: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] docs: fix 'make htmldocs' warning in leds
Message-ID: <20220630160941.GA70425@praghadeesh>
References: <20220627214311.7817-1-praghadeeshthevendria@gmail.com>
 <e2eee869-3e72-ea18-6afc-73fe5bc5dbd3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2eee869-3e72-ea18-6afc-73fe5bc5dbd3@gmail.com>
Cc: praghadeeshtks@zohomail.in,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, open list <linux-kernel@vger.kernel.org>,
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

On Tue, Jun 28, 2022 at 07:31:54AM +0700, Bagas Sanjaya wrote:
> On 6/28/22 04:43, Praghadeesh T K S wrote:
> > Fix following 'make htmldocs' warnings:
> > ./Documentation/leds/leds-qcom-lpg.rst: WARNING:
> > document isn't included in any toctree
> > 
> > Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
> > ---
> >  Documentation/leds/index.rst | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> > index e5d63b9..b9ca081 100644
> > --- a/Documentation/leds/index.rst
> > +++ b/Documentation/leds/index.rst
> > @@ -26,3 +26,4 @@ LEDs
> >     leds-lp55xx
> >     leds-mlxcpld
> >     leds-sc27xx
> > +   leds-qcom-lpg
> 
> Hi,
> 
> I had already sent the fix at [1] (resend at [2]). Thanks anyway.
> 
> [1]: https://lore.kernel.org/linux-doc/20220604015735.249707-1-bagasdotme@gmail.com/
> [2]: https://lore.kernel.org/linux-doc/20220612000125.9777-1-bagasdotme@gmail.com/
> 
> -- 
> An old man doll... just what I always wanted! - Clara

Hi,

Thanks for your reply.

Thanks,
Praghadeesh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
