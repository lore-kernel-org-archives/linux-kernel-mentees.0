Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E23C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:19:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAA82080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3VKG60q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAA82080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EA8B86BB2;
	Sat, 26 Sep 2020 06:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NwzGDSDr0al; Sat, 26 Sep 2020 06:19:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE11A86BA6;
	Sat, 26 Sep 2020 06:19:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7017C0859;
	Sat, 26 Sep 2020 06:19:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF8AAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C835386BAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rK231m-Zxjp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:19:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0D69086BA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:19:34 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id nw23so1523478ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zZmshHuPcv21ywssuGLki1uOusIzBhoKJWRR5AJtOuA=;
 b=H3VKG60qPoI/JAXkDWIgXOSedeR7XUE7GrucUiHglrQihIcI/qp6KxlSkyEj6qef5r
 xMoelznawc9jMeIVyZHMfKD5YpCBAuPpAretk+Ozfo985IFXie/AyFGt+s0GTz+LBmUw
 8yae8VisimiCKdgICfvSZaZX++qw+CstjALyl+2fklKp2cgRa3qsa3Cu9FFFp3jIEld4
 MrLR4M8pbVkrtrCfCwgzawNaDQ59XeC0LRRuNUL+0Yj3WO0FEAB6DysiDxmsnG2A0KzD
 2KAYzny3caOnPBWmDS4jRu6Ba8QvjMw+S9yB64rD6cqx+x5aKYBMOyVD2w7fafbjYTtp
 hhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zZmshHuPcv21ywssuGLki1uOusIzBhoKJWRR5AJtOuA=;
 b=tWsY2qaml43xEPUdDVzfYU7PoBx/P6SstVfNO8B2q6p5SYxmbyEnB6iO0SXSsZAj+h
 mu10CCwkTvlSxyhkttSULSe2O2KNX/RbuEin9HyPOrhGA5aOZZpN61XbYRFUwjIAJTXY
 F7jeSKP59BSd6Q5w8Vy1hAKTtppWDQr8Fm9p6qOPZvzqXmskXphG8D7E6eC+c0pK0M8i
 liyadGTjCBTlI9FsDc4PJVaun0aM8UEGqWTIElagpbeafDnMsGyoc6WYBKuWpsQwQcBb
 E2zQeiG3SMfW7Yu+UFAdQgZX7auViZ229yj35VRhHxPO4cr55ZKvOP9/NbB/rJODYunC
 6pfA==
X-Gm-Message-State: AOAM530VMprA5lzwjv9fv19nJHOFFQZ+czLWl8Hmn+gb5bQ6CSZR2E2X
 e6EdSE/JiM1ZOthuuN4KiZA=
X-Google-Smtp-Source: ABdhPJw9TRoZKnoppjwwvFRtHsJgxfvW/HkzAE1kZvknZ4YtJL9+Z1MXzn/3ET4kX+RRRXuORyO+GA==
X-Received: by 2002:a17:907:2115:: with SMTP id
 qn21mr6088312ejb.278.1601101172571; 
 Fri, 25 Sep 2020 23:19:32 -0700 (PDT)
Received: from felia ([2001:16b8:2daa:2000:7099:7490:f83d:38e7])
 by smtp.gmail.com with ESMTPSA id by24sm3409119ejc.100.2020.09.25.23.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 23:19:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 26 Sep 2020 08:19:30 +0200 (CEST)
X-X-Sender: lukas@felia
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <20200926061100.GB637197@kroah.com>
Message-ID: <alpine.DEB.2.21.2009260813030.4734@felia>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <20200926061100.GB637197@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
 when calling scripts
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



On Sat, 26 Sep 2020, Greg KH wrote:

> On Sat, Sep 26, 2020 at 02:50:08AM +0530, Ujjwal Kumar wrote:
> > Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> 
> I know I can't take pathces with no changelog text, maybe other
> maintainers are more lax :(
>

I would like find that maintainer as well...  ;)

But *serious mode* now:

This patch was only on the linux-kernel-mentees list so far.

Ujjwal and me are just using the linux-kernel-mentees to develop the 
patch together. Before we send it to lkml and linux-kbuild, we will have
done a first review and will have a proper commit message in place.

Greg, your feedback on these patches is of course always welcome when you 
spot something smelly.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
