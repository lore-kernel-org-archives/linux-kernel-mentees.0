Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A31C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E99161989
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E99161989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0C70402A6;
	Mon, 29 Mar 2021 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIH_z4BeErpH; Mon, 29 Mar 2021 19:12:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1001740152;
	Mon, 29 Mar 2021 19:12:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB42AC000B;
	Mon, 29 Mar 2021 19:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7211BC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 19:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A62C40380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 19:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnlUR_2t1qVT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 19:12:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 836A0402B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 19:12:28 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id z1so14866735ybf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKmYLaEk43CYTxU5svn8oc1fILpHmvISVJqZG9ciT94=;
 b=glkaGcAkaW6c9C9lNHLJh/6XL9XUssMG00pOAbm81S5bzhukitbWs4oSCgyE0SDOKY
 aEk9SLcQkb/Fsy4UncKK8g13CpFOiK2al1OmALUUHnhLccshR2ESSxR09512PSMm9lTD
 CbImhRw/EY0QyBAdvwPtIDI1WM8T28qa405+nJ8y1TA+BYM5EFZbSJb3gSVGRqbz0sbX
 NhrwgJWtbreFCGyLCGXgft/pTRmqA26a5udUKIw6XHZcQgqS6O0x7CgW1NnwD3M8aBgQ
 8Vg7VYPPH6ujoZ3SuAto3a7Qlf5Lis4po5PtH1VQ8k8PoZ55uZdd61Cbj0aJyO1LvaC4
 NaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKmYLaEk43CYTxU5svn8oc1fILpHmvISVJqZG9ciT94=;
 b=mXVWx5ZMbDtQYoHxDDE2YiSEp5yvEnc+2l1vFFkvF0S4bG8EYXNcjmBTD+JUQxQLVB
 9ql7quoCT/7JWYDRC+nUdQSjMVtw2a+FFHGA4v8rTZgNbC0Uuca+HM4t2vgXU842F8qR
 j/lnAYif9P7sxGaCPLyewzsmMg53ImGr4AjkLZTa5zQHApc335RyO+cjiWeq8oh52Pc8
 4zw5VSny0hrapl4AJwI1oasP4uxZdFKIH2cFWz4LiMD5aN1koczKVZyiqGfDFtOw1JhK
 JNfaVS7oEQYXMxgJccZIvq4/NlUbsFxeUUhsJJ4/w72VuV284j72bLBXkkSlkJiFLpdi
 jT9w==
X-Gm-Message-State: AOAM533waWFDKsy2DM+VmPUmtjPzotG4hNCIg2mFJsjsMCRRE0GpwKEn
 DH4NuG3esyg4SKERBez2V9RCROKSbbc54dphiKY=
X-Google-Smtp-Source: ABdhPJx6awGKtvZYWTCAaFfb/psgHVBPq9Uis53zOwOW3G8m1WNj3B6YanbsbiMxIj0rmuybo2xNeQ4jUH9ro6ISg9I=
X-Received: by 2002:a25:3b55:: with SMTP id i82mr42784655yba.422.1617045147596; 
 Mon, 29 Mar 2021 12:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210329121054.20474-1-yashsri421@gmail.com>
In-Reply-To: <20210329121054.20474-1-yashsri421@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Mar 2021 21:12:16 +0200
Message-ID: <CANiq72=-ahHeOJY66OjVF1A0WZfGyepWs4K7QvY7Tyk1Y6Uw_g@mail.gmail.com>
Subject: Re: [PATCH] lib: fix incorrect kernel-doc comment syntax in file
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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

On Mon, Mar 29, 2021 at 2:11 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.

I assumed these come from the original sources and were not adapted,
but they aren't there, at least in the current version in GitHub.

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
