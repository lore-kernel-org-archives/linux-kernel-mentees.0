Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA75C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:33:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A440521D81
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO6V0+jy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A440521D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 105D3880B7;
	Wed, 14 Oct 2020 18:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFVrsAINQ5B5; Wed, 14 Oct 2020 18:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 713C087CAA;
	Wed, 14 Oct 2020 18:32:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56A72C0052;
	Wed, 14 Oct 2020 18:32:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B455C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E62A487778
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvlS23N1C0el
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:32:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 97B0587764
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:32:55 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a12so80137ybg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atNVlH6irrx/d183AJFwkx780asL0iHEUrSJ6WHJ9yc=;
 b=KO6V0+jy5MSu6HfIesopDuf0HYsLMJF4iB+FFLjEgefyl/V5+/IJ2u0OfMNXzTSk3X
 4rBv97O9CKqElHhCXOm/sASazgXZ+oFBJg5rNTorbO0szyxmZmvkV2d3zHCQvT1fF8we
 O50SzPEBoFhlBm0sobzc6zEZ/B13iZIauX1dqsZYf/uSfJGGWxiIOeHNyrURb53IXtQY
 Ve4yhba+GK8+B1V2ohVTFJtWyxItLj9PWWZEeUKhVI1QwmHGxs7hbw+qsZqLGf2sPfSI
 75KrNb1hUksajh1Mict4Z1bDSmabfNx/a1KQ3Gpco4jamDdfR8aLQteeoMgm6vGscipU
 oncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atNVlH6irrx/d183AJFwkx780asL0iHEUrSJ6WHJ9yc=;
 b=XGvmZAyIyc0oU64rUtGK6Za5oRvCEraGDPoQGJwj3ccPuEwPMXO4ftBcXjFtJeZfyC
 wEkjLKIu/p4+gRbLHUk/yi9wZLcfKcFfM6DcQBqxWGQ2CFIqpa+iySlSXXCufvvi+qfW
 Qro7YVSsx6uGOhNDsaMsjoViFsXUCspiQP1X5XEkCjo7ftxiUjBtc7fQ8n2asCIBL2O2
 R9I+QnbcKGKcrjYsCHC/sUZWv1kHLOJZd3ocvAGTK8ilJCpac1zgzFteTA4hxuJkkIbp
 fNeadK28WcDh/TynxoTSHWdAo1f9GHqslhvgAXRVeENoscfrjmANbf1Uvkt0FW6EMOaS
 VExQ==
X-Gm-Message-State: AOAM531T4SM9PLj+Jg26eiEneF+AkWj8oEdTD9Up5fCDml0tWQl2YAPB
 OHu7BGrJdWw9C2x5PEU0derphlhYl5zNiDbTg5U=
X-Google-Smtp-Source: ABdhPJwZ2gPHftiwCqEtjOWKle33rGuXGLfcqNWBJ4jkWev+2n+cSU4SpOc/cvGesvc4/N9ngP0IByDPrwZ/7dpVi34=
X-Received: by 2002:a25:3b4b:: with SMTP id i72mr132415yba.22.1602700374479;
 Wed, 14 Oct 2020 11:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
 <CANiq72kogiVbBURCrb74_vCPCLb09LGTudxE-QG8US7pX8LqQw@mail.gmail.com>
 <fc0c8503257ab6593ea8a1250ee3ac083a4ab5ee.camel@perches.com>
In-Reply-To: <fc0c8503257ab6593ea8a1250ee3ac083a4ab5ee.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2020 20:32:43 +0200
Message-ID: <CANiq72nNkqu2a0KoDoj7Y0K2Ud37Ode5U9ju7JyPTtv58QJ3cw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Wed, Oct 14, 2020 at 8:05 PM Joe Perches <joe@perches.com> wrote:
>
> Any 'formatting off/on' marker should be tool agnostic.

Agreed, they should have used a compiler-agnostic name for the marker.

Cheers,
Miguel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
