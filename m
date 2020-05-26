Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664C0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 22:29:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9422208C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 22:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ajCuuPdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9422208C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0A8D88680;
	Tue, 26 May 2020 22:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vatNUknFHn5; Tue, 26 May 2020 22:29:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 622958865C;
	Tue, 26 May 2020 22:29:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F9CCC0888;
	Tue, 26 May 2020 22:29:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25F8EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 22:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0EF418867B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 22:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Kn33Y8p1mEn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 22:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 589528865C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 22:29:40 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id x22so17707345otq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5wqB25Ndtf7G896Xqr2DU1ONCjpaiNIvRfUkDhIp+o4=;
 b=ajCuuPdVNqJkiWUnn8o03t9TsMo7OEm3Qkfy9klzyZhl3i1I3ekfHr0s9Zn3xB8saQ
 KsS8XImoIfanBQsGd/FJI/5xiiDtBWFT7WfsF7PAbZAWWtlc37D0g9zX0Irm3bp5N0By
 533c/c/rF8H6sPab+sGruZq3Kx8M7fEalWda8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5wqB25Ndtf7G896Xqr2DU1ONCjpaiNIvRfUkDhIp+o4=;
 b=Ko7UORDbx8O10iqhVQ8rnOr4uqXKNLVI4UdIrh6cBM4bsA3ccHLVs+JsfygziE7hCZ
 V3Exc0EpVgL7hqr4ExsmEsGUGGJ7zdmezZyUVhBo2qMdJvODu4ft/Y+u1AcUNisgOTp/
 KurgrpmmNP8KOiN8VreVZ6Dl9GNhacoEOdo0uWJf49X39new6Fib/rvLybttDgwoKPiA
 0N7r7gyWxU602o/kOOssZGYfiiXXC3NJZSbQpARrTQcRCH9Va75PqXi4F0ORvmpmcI1V
 +DLwqFoZUONwD9uUPSYW40tnSZGIyNbcKeAkt5pcIiI9kgZX9EWveEF5+z7UYM3PWWmO
 SiWA==
X-Gm-Message-State: AOAM5312OETXnyTAKaDeZQz0ogl5mPdX4saPSl7kY7njA2EbgXroDd6Q
 KCFhYh6tlRr93T7FXQ2Y/JBSgnkW
X-Google-Smtp-Source: ABdhPJw2UJGheVoQlPvhb7lYFGjKDjL07dSv/0TUE+bFEqIDtMMdHttQ9hsCTHmFNvxtgVQFW6OFrQ==
X-Received: by 2002:a9d:6092:: with SMTP id m18mr2402145otj.117.1590532179333; 
 Tue, 26 May 2020 15:29:39 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id d21sm282371otp.46.2020.05.26.15.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 15:29:38 -0700 (PDT)
To: Vitor Massaru Iha <vitor@massaru.org>, kunit-dev@googlegroups.com
References: <20200526183436.47026-1-vitor@massaru.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ace26347-a78e-1bd1-86f5-f8e644aa93ec@linuxfoundation.org>
Date: Tue, 26 May 2020 16:29:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526183436.47026-1-vitor@massaru.org>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [fixup] kunit: use --build_dir=.kunit as
	default
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 5/26/20 12:34 PM, Vitor Massaru Iha wrote:
> To make KUnit easier to use, and to avoid overwriting object and
> .config files, the default KUnit build directory is set to .kunit
> 
>   * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205221
> 
> Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> version after merge on kunit brach:
>   * fix identation (tabs instead of spaces)

You mentioned spaces breaking python. Please include the python
errors and make it clear in the change log what is fixes.

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
