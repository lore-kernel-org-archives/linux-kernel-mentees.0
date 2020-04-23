Return-Path: <SRS0=CC7Y=6H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400A6C54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 14:35:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D8520728
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vf8Ep7dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D8520728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C9A3420462;
	Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4w2koJuthhr; Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 38AE620364;
	Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E1E0C1797;
	Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B4B1C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 14:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 490CD86CED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 14:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcjjuEW1lGwb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 14:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F8A586CBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 14:35:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j1so7130595wrt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x6IGIVHimLN6wXXRyErAIS+MRNtXI4hH2CwyG6Xff30=;
 b=vf8Ep7drlVFpFPiDnXCutY0TNWGrNo8Xncv2udOcbey1cXFppOGy4CONEDFgH3iI/j
 cPG+bOr+DeXb9D5cEFTkQ/ApdoEGgKqnH0Mfdj3rMaYdt3PTzrGkZrqpN9M0jfx2jxK7
 +JtJBwVUMmkszV9SZkHhv/V3keBtmCQt6INjSdmLaGrUaF71Dfw3ph0q02qvZDqa7xjG
 sDXh9fdNg/3xYeeQ04KaI9+jlD5B2UVwz9eDT4sQKg4gQrQe+CDLnuHIi6e0iploviqL
 CWzqSckSWzdDxZ7qCmtwoLGia8OJL2fNk/KGo7+B6nJnlch+YdQNE9a0nlwCv7DfSFvO
 hMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x6IGIVHimLN6wXXRyErAIS+MRNtXI4hH2CwyG6Xff30=;
 b=uWW5kz+bhkLw3rPMsUS+PPlTVMS98GJ9AZd+j++I/FKHWPM4/IqW++SZMSnZusMSEO
 95QDIpAplf2RbuXa8ZtvvheJxKGDbHlyws9//WXjPf0nG5a4ypAvCSO3HmITt7LEliMb
 e2XZHbgGCdL0OEyyLksXkVdz5/9+DqIEgt7UNR1Q0XnCLNurYhLCyLdpALi/Unb2ifrF
 KGDxZIfFh8/+de9Ykm6YVlI6iDIG2uM8FeXNwsfVxTDJu91ROWjMwSW1xS431lMw8ikY
 Gpw7jKgNbMUvjVmuHMsrbvXE0DIdkPRPkz+K/iQRoCdnO2S5I/Z+872wRn7T7jPBAmDs
 0s4g==
X-Gm-Message-State: AGi0PuZ65DCalT72VGcLmlJ/0XLtbqvNjo5pNv8/sMXtvSdZjs26xGMR
 C7uZnpvxkLxylmS4QsdcISk=
X-Google-Smtp-Source: APiQypLIUH9cLSTf94KBbNXeLc8HmzzTpjl+Y2L4JZrTFpsXOzsPlyUs45ikzIJWhNEC7Yfw6+4rqg==
X-Received: by 2002:adf:eecc:: with SMTP id a12mr5225266wrp.112.1587652544894; 
 Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
Received: from net.saheed (563BD1A4.dsl.pool.telekom.hu. [86.59.209.164])
 by smtp.gmail.com with ESMTPSA id c20sm4420321wmd.36.2020.04.23.07.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
To: Jonathan Corbet <corbet@lwn.net>
References: <20200423114517.18074-1-refactormyself@users.noreply.github.com>
 <20200423070230.3fd863ba@lwn.net>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <41072c85-7157-a3b8-17b5-9b4ab38f14ca@gmail.com>
Date: Thu, 23 Apr 2020 15:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423070230.3fd863ba@lwn.net>
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Stephen Kitt <steve@sk2.org>,
 Kees Cook <keescook@chromium.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Eric Biggers <ebiggers@google.com>, Andrii Nakryiko <andriin@fb.com>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-doc@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: Fix WARNING - Title
	underline too short
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


On 4/23/20 3:02 PM, Jonathan Corbet wrote:
> On Thu, 23 Apr 2020 13:45:17 +0200
> Bolarinwa Olayemi Saheed <refactormyself@gmail.com> wrote:
>
>> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
>>
>> There were two instances of "Title underline too short" and they were
>> increased to match the title text.
>>
>> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
>> ---
>>   Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> These warnings are caused by a patch entering linux-next via the -mm tree;
> Randy has already sent a patch to fix them.
>
> [Next time you might want to examine the recipient list a bit; this patch
> was broadcast a bit more widely than was really necessary.]
>
>

Noted, sorry about that.

Thank you.

Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
