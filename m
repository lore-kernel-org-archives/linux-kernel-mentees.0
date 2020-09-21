Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC475C43469
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566EE2145D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/i3Hu5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566EE2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F1BBB86788;
	Mon, 21 Sep 2020 13:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67ZW7WR-3lgJ; Mon, 21 Sep 2020 13:27:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 830C086785;
	Mon, 21 Sep 2020 13:27:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B083C0889;
	Mon, 21 Sep 2020 13:27:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D85BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E8EA520346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAJlkAEGNxys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:27:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 600802045E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:27:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id q13so17693418ejo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rv91s9Cv5/2AdRVh+Hc7wckGu2fCZrhpyvCLz+dVoXw=;
 b=s/i3Hu5oDdk04fFkjw0iDMngn7xCE29aov+B90To8GMndbx7Pzkwx8pQqr40Mc29Ts
 etYan94LJWTaBDNiEOgEdGYReI2Sgx5RV+1EDxT7UXYLvNJ4aG+/e31p583sIPVDi2Eh
 QJz5VSASRXs6+eCsjbKgq50GMBaczE6Aitbht2g41YGOh5u+N4mxcgG6FLFKnqXq61yb
 Uv/EeOoPGBSRW80hegsIStgD2V1u3QMTKpXq5nLfGQjPwOHb81PU+k1MiEsKCNirEm2V
 idFAEYwW56U1/cgEEJyNi4slPz/+QYpMRONqCGnIaOvTUKhne8Gt4VL68CUwXXEYW3Tx
 ELZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rv91s9Cv5/2AdRVh+Hc7wckGu2fCZrhpyvCLz+dVoXw=;
 b=AzjxhAKsjidUeyvoU66XiN4Z1XYxC7eTm4TU1/oUeWPpcecgt6P1vpdLkhXbnKQqOu
 Dj4NH8UhetJj8mnBvSFHlOLqdduLFUab18kUeo5fXbj+cg381tffGjdIFh8FPx3zD3eR
 FLCSCdu48ScA1vo9a2Ja/h5GsMQPGBJyhxJCX7Y/yaIlYTJDnnK2xQw+C/hSmv2OKpmj
 wxC25eTj8Y6rAmSG2TltRyJwSuz6lCqIUy5VJNmHepWlLEUD2252cJsHrvjEBAsCBNMc
 d3LPuvEU3FCQqCBQUBwVjYRGq54oI5CRpimRtzj5jX+XTwqsuFi07dErrzH/fPimuQsS
 /Atg==
X-Gm-Message-State: AOAM530Gre6Hojbojo4tz2jEJesROy3TwnFaolpwAEVHvWGsTwWdrElI
 WXvzVbhdTdCnZyvWwpZlx0A=
X-Google-Smtp-Source: ABdhPJxARNsOXqSp61POBWkIZJOMseG358/cGjjpZozyoCheSNfl4z/PbhGhbBcOf+6DTbCka0dGjA==
X-Received: by 2002:a17:906:f90c:: with SMTP id
 lc12mr49224662ejb.104.1600694844768; 
 Mon, 21 Sep 2020 06:27:24 -0700 (PDT)
Received: from felia ([2001:16b8:2d52:a400:b8f0:7fc9:d2d5:7244])
 by smtp.gmail.com with ESMTPSA id z23sm8891308eja.29.2020.09.21.06.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 06:27:24 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 21 Sep 2020 15:27:22 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <9ab72752c9c11bebc15a4a0776d1b1171cdb63bc.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2009211523310.19489@felia>
References: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
 <9ab72752c9c11bebc15a4a0776d1b1171cdb63bc.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl improvement:
 NO_AUTHOR_SIGN_OFF warnings for users with multiple emails
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



On Mon, 21 Sep 2020, Joe Perches wrote:

> On Mon, 2020-09-21 at 17:41 +0530, Dwaipayan Ray wrote:
> > One possible solution is while parsing the author, also load mailmap
> > and load associated email addresses to the author and load it
> > into a hash. Next when a signed-off-by line is encountered and
> > the email is found in our hash ( or maybe some other ds ), then
> > the signed-off-by match should be positive.
> > 
> > Is this feasible? I would be looking at other possibilities too. But it
> > would be great to have your view on it!
> 
> Either copy the mailmap handling out of get_maintainer
> or strip it from get_maintainer and put it into a 
> separate perl module/file.
> 
>

Agree. Dwaipayan, I pointed you to read_mailmap here already:

https://lore.kernel.org/linux-kernel-mentees/alpine.DEB.2.21.2009181238230.14717@felia/

Lukas 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
