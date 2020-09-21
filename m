Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751B4C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:15:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C41214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Z+WLBD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C41214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66FF9871BA;
	Mon, 21 Sep 2020 09:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cXuE7RZTIau; Mon, 21 Sep 2020 09:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0386886FE7;
	Mon, 21 Sep 2020 09:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDC5EC0889;
	Mon, 21 Sep 2020 09:15:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3073CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 16905204E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqJSvIUCXYSt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by silver.osuosl.org (Postfix) with ESMTPS id A459E204D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:15:18 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id o8so16631360ejb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kE06TYl1jRgIMZnXLIt/Yb1FSbincXcZmCiTm+r298o=;
 b=B+Z+WLBD0WMM+EM9Uj/fhRpLAVqO/UXuBirlX6B5uHV3KWOoEHNhdNCd9sQwrv3RPE
 BM8Xj9g9tcska1+K81zipesTCC6eOiO0t0bN2jGC0wQzF47iMJ4ZvGA9UeedpQZkwS5q
 HIB/XxIWdDejia+j4noYYFnRRbK2cowUk3gDOarZnSZYuHPrf6uSW0Dlq7XjWScBoRt6
 O9lAHxdCW7zstzn/DMHyQ6mA2wskYMUR7JMywLdGatK20KdwW4YYxuUrwVyN1hO7p+G9
 R0yQsz70iiYpTSeaVslTN9ElF/SDx4ESxwakA6GegdXJRvFKrmwoLv3QqqUJXP70NzDi
 H4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kE06TYl1jRgIMZnXLIt/Yb1FSbincXcZmCiTm+r298o=;
 b=dAyjqtr1GBXNWZB25BS0MrWDRdX+OqIHSgR5Qeh0K7w5UU9nFqCo74FPuOJh2XDPT/
 ENCmoB25sFzsrf0wqL7Zq0kmrAzj9la9XK2A+LVS1oLBITw8hWL/o/WgSQdrfnMj3+Yf
 w3Y7liGerxqXZRryHM6WQKXZjiBRIsIPF6p04aCfqpIZsW2Ci320Xldm8JhkVhAHERTf
 uC3YT76dBYAgPaUL9JcxIisagxbyZLPKrt9JE3AptZ90xQU+FMj7NNxTsACjnd9wj1k4
 2iUocwNRbTbhZ7oQYedfUSDkSeMl4HIFF12GxqqahBVV2MUDbknrthQTe+Mc2aB7hWCc
 9T/g==
X-Gm-Message-State: AOAM5328qAxzpesu/rFzpVxUpdk+PMsqZHDYYRttaYUWScPVoA9/ifYr
 RvIFjrU2q+N127oEGtCuJb8=
X-Google-Smtp-Source: ABdhPJz+j82ZRh+M6uneeutj33bHfHP/1VV/RdGSfT4y0q+SkDH7sh9FKmHMNB0FdI6Im8MVpOQHBA==
X-Received: by 2002:a17:906:82c1:: with SMTP id
 a1mr37395183ejy.270.1600679716959; 
 Mon, 21 Sep 2020 02:15:16 -0700 (PDT)
Received: from felia ([2001:16b8:2d52:a400:69ec:6d66:6c4c:48])
 by smtp.gmail.com with ESMTPSA id q1sm8387161ejy.37.2020.09.21.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:15:16 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 21 Sep 2020 11:15:15 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009211112460.7483@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Mon, 21 Sep 2020, Dwaipayan Ray wrote:

> Hi Lukas,
> I did send out the patch.
> Weirdly enough, my gmail inbox decided to combine both
> threads with subject [PATCH v2] and [PATCH v3]. Did you
> get it separate or is it the same case? In other mail boxes
> it seems to be okay.
> 
> Apart from that for fixing the different email addresses, I
> am thinking to try copying the read_mailmap subroutine
> from scripts/get_maintainer.pl, see how it works and
> try to write a solution based on that. I will let you know
> once I achieve something.
>

Can you describe in a few sentence what the problem is, and which solution 
you are exploring to Joe, linux-kernel and the mentees list.

I would consider that your project proposal for the first mentee 
milestone. With that, we can progress you to become a proper mentee in the 
community bridge platform.

Lukas
 
> Thanks,
> Dwaipayan.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
