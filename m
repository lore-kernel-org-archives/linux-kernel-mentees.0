Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963A3C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:20:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E739320759
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQtNgRRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E739320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A6D687575;
	Fri, 25 Sep 2020 07:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YdlaKrjG6IA; Fri, 25 Sep 2020 07:20:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 87D2187573;
	Fri, 25 Sep 2020 07:20:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71AF2C0889;
	Fri, 25 Sep 2020 07:20:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE700C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8822F203DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwqOJRMQIFJQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:20:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by silver.osuosl.org (Postfix) with ESMTPS id E130B203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:20:39 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gr14so2286961ejb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=BIYPSauCXrdJ/NTcI960cU8GQNVwIJtGlv//g+Sgg+o=;
 b=lQtNgRRCNIjAPGnDt9NybVpJt3M0sIuTf3GP7u4QbSsIpqsh5xL3EOLZ6qAwVHwxY2
 /g+cQ6o0tFWOC0DB/5JAI7DXSu6EiTfHbCEcbbadQEysxbNImEVaWQaZfW/SndrFbkz/
 naetI0uvrk7P9OmFGFd/zGvXMxEkCRqV5gNd46gNrOsq2IUj4DJiZ75iMSAUWidlxs7l
 Im9V7MBUaycgz53SoISubyO0uPlP02FnanVlGloiOib7UlGElUscy3eMwHGJ2dTqiW3h
 qO9+wJVImGPBXuzbooSTdIX0V9jaHihpp8J83Uj3mBH4gmfcO2u6+El9BLt3aDMOq4e7
 qutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=BIYPSauCXrdJ/NTcI960cU8GQNVwIJtGlv//g+Sgg+o=;
 b=aDf5YSUx3+tytJCHpa4uoSi/SFO17SEGKS56BLvDZyW6XRKS/ylQe2pOfdhhXXDCS2
 cHM2Jm8eZsfLFHueAAofs5SYpLKU514Fr7v9Qd+0o8HQlBCvC5tPtHV/PBX7xv8Kv73q
 n+2W++lit5LXKnqm92bPMov7kz0LAqQbV0jR1w37ovoL1aDl/e/d/dklI4LR826YAnmS
 SJfllc06dYfxqnr+RDgRlnaJvhIf7ZoDOl2fBb4Eu+jkcBi9ecR/Cy5O7c2f2/iPLcAM
 y9CKUHwAqWAi/iOZafgrDO3vo7Pqygr+XtERcyEtNIrQQLAPnv4/yxChIzM6E8tW8yTS
 lNmA==
X-Gm-Message-State: AOAM531nUKRvGCZogzfrdut5BvQ+v4jMR/NkZmthdmqlyhkCrjrBFU5P
 NfSVXzONLD0O+hZtcsJPytg=
X-Google-Smtp-Source: ABdhPJyd1LOCicyRXlC5gTUmOXF/aLIMe0RTLAubHFVReaK3pxmdR9EkXPw69X1cs3gOL4HfR3w4eQ==
X-Received: by 2002:a17:907:2173:: with SMTP id
 rl19mr1348369ejb.514.1601018438246; 
 Fri, 25 Sep 2020 00:20:38 -0700 (PDT)
Received: from felia ([2001:16b8:2dc8:d00:2cef:8073:5504:c57f])
 by smtp.gmail.com with ESMTPSA id j18sm1226427edj.62.2020.09.25.00.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 00:20:37 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 25 Sep 2020 09:20:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009250854230.5992@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-531631132-1601018437=:5992"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-531631132-1601018437=:5992
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 25 Sep 2020, Dwaipayan Ray wrote:

> Hi,
> As Joe mentioned earlier, there might be four new
> warnings to handle better:
> 
> 1) Same name, different address
> 2) Same address, different name
> 3) email extensions present in header but
>     not in signed off by
> 4) comment blocks after name
> 
> I am thinking to solve the first three in a single patch.
> 
> As for the email extensions part, should it be handled
> differently? There will be redundant calls to that
> though because it's not an error seen quite often.
>

Dwaipayan, thanks for this initial structuring.

Let us try to put some systematic structure into this handling of the 
NO_AUTHOR_SIGN_OFF.

There are basically two aspects to consider:

- which classes are potential mismatches can we potentially observe?

- which level of severity do we assign to each class of mismatch?

To the first point, you started with some initial classes above.

  0) same name, same address (no mismatch)
  1) same name, different address
     subclasses: (how 'different' address?)
     - email address differ by valid difference, e.g., extensions that 
       will go to the same inbox, e.g.,  the xyz+fds extension in mail 
       addresses. (that is your class 3, right?)
     - two email addresses that are known to belong to the same individual
       - known because of .mailmap
       - known otherwise?
  2) different name, same address
     subclasses: (how 'different' name?)
     - examples:
       - Firstname, Lastname (but middle-name initials differ)
       - special "regional" characters, like ü vs. ue, etc.
       - firstname and lastname are reverted etc.
  3) different name, different address (but still we believe it "matches")
     combinations of subclasses of 1) and 2), which we want to consider.

Then, to the second question:

So, these different classes we can think of and "assign" different 
severities that checkpatch.pl can use.

Checkpatch.pl already has four levels:

three severity reporting levels: ERROR, WARN, CHECK, and
the level _do not report_ (which is implemented by just ignoring some kind 
of difference).

I think a lot of discussion will be around what severity to assign to 
which class above, and in some way, long-term maintainers have a larger 
say than we do here.

So, let us first modify checkpatch.pl to identify the various classes 
above, maybe just starting very basic, with different name, same address
and same name, different address and run it over the commit range and see 
which examples show up and how often.

For now, we first just use checkpatch.pl to identify the different types 
and refine them into subclasses; then, we can discuss with severity should 
be assigned to which type of mismatch.

The second question should not invalidate our data collection and 
identification of subclasses, though.

Does that help? What do you think?


Lukas
--8323329-531631132-1601018437=:5992
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-531631132-1601018437=:5992--
