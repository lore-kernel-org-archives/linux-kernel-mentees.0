Return-Path: <SRS0=yja0=6F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63222C2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 09:44:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1572070B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 09:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS+2/hYn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1572070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF08E86A5B;
	Tue, 21 Apr 2020 09:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dai_BOkMmVh4; Tue, 21 Apr 2020 09:44:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 84E4386A47;
	Tue, 21 Apr 2020 09:44:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79BBCC1D91;
	Tue, 21 Apr 2020 09:44:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0826BC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 09:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F364F87987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 09:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JE12OE89ek2a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 09:44:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B0548745C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 09:44:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u127so2920186wmg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=X+mMYA3qFXoBccYe5Q1v2EYprBmty90vAJWRd3ogZ1U=;
 b=CS+2/hYnNasWB2jsNLAmXFrYZj8KcOi1PYvpIWp6wKqjGvOCuCI2lSZfP5MXBoo+ke
 Kl0z2hM6tvn2msODMVuoBnHYnqHGyvDF6IUOI7773QcN563zNqJQ3u3fDQRvKcb3AOFe
 CoHiFyfhJG6sJg/NwrfdePa1/9a/jqOA6yPNQAVD6z5cRhDf5pxCgzIR0axw8l0NlszG
 53PChfMNSfEi9xSUzqxed/lB/u4OqMF3s/MXqDrsT/ggKrFkLEFg0zK7boJLczbI9ybe
 hqZwusLORpg7O7OXosC+twm6CnTP48tPeDvBrMvsQQwf4GhPPju1DbCJk6FZlD03dDcx
 O9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X+mMYA3qFXoBccYe5Q1v2EYprBmty90vAJWRd3ogZ1U=;
 b=iMoZwUYFAx6KYC/MEK0tpze8P7oWFfi/4CEBa8iJ72BqQRbQ4RbdbY8X6+o81dIO1R
 xyND68RfaZd9CeyEeO+uElDTDfGU6p7PdHJi0Rfm3ugXINcENx4o45XjQQ4tvVmtUdmy
 fs87kv57jwn2bgAQGjs89zTx3wgmjl8dq5R56wn2KhNnB4iKK2B5dc4dLwnsgNIWM0yi
 KDAeipSqeKV8zkCSKnRZno+8vkcboVLTsZhyHihTWZBqFRgT9jk/PuYMHScxdBHr2nyf
 JJ1pVduRc4Hnb9iqfCrDDf70on/4bXGkx9Zt1orqZG+LTPKio+Q+IsL3mnyQJ2+z2zvY
 C8Rg==
X-Gm-Message-State: AGi0Pub5ZRuYK5KRqWy+BKTl9lpkfSmOAVw7lmcdbOatWxZMxTk/HmFC
 1YeMalu2+kTekpFQp6IwjL8=
X-Google-Smtp-Source: APiQypK9RmLpEkjqKlDlxU2Llmi1B5lIMlL8Bl1HFjjxcyZpessuLIwBnke97WzNyp52okucfTPVTg==
X-Received: by 2002:a1c:dfc6:: with SMTP id w189mr4140181wmg.180.1587462269984; 
 Tue, 21 Apr 2020 02:44:29 -0700 (PDT)
Received: from net.saheed (5402C526.dsl.pool.telekom.hu. [84.2.197.38])
 by smtp.gmail.com with ESMTPSA id n2sm3280622wrq.74.2020.04.21.02.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 02:44:29 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
 <20200420085641.5d8f1a0b@coco.lan>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <db880a02-6dc8-7844-254b-682aa41fd54f@gmail.com>
Date: Tue, 21 Apr 2020 10:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420085641.5d8f1a0b@coco.lan>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Clarification on the behaviour of
	checkpatch.pl
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


On 4/20/20 8:56 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 20 Apr 2020 02:20:19 +0200
> Saheed Bolarinwa <refactormyself@gmail.com> escreveu:
>
>> Hello,
>>
>> My experience is that checkpatch.pl will not flag some warnings when I use
>>
>> the '-f' flag. This especially true for .rst files. My understanding is
>> that this flag
>>
>> is needed to use it with a raw source file instead of a patch.
>>
>> Please, I will like to confirm if this is a normal behaviour or is it my
>> system setup.
>>
>> Below is an example from the current stable release linux-5.6.y
>>
>>      [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>>      total: 0 errors, 0 warnings, 279 lines checked
>>
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
>>      obvious style problems and is ready for submission.
>>
>>
>>      [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
>>      ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>>      WARNING: Possible unwrapped commit description (prefer a maximum 75
>>      chars per line)
>>      #6:
>>      TAA is a hardware vulnerability that allows unprivileged speculative
>>      access to
>>
>>      ERROR: Does not appear to be a unified-diff format patch
>>
>>      total: 1 errors, 1 warnings, 0 lines checked
> If you don't use "-f" flag, then you need to pass a patch to checkpatch,
> e. g.:
>
> 	git show --pretty=email | ./scripts/checkpatch.pl
>
> That's btw what you need to do with all patches you would submit upstream.
>
> The "-f" flag is used only when you want to run a check on an entire file
> (and not to the lines modified by a patch).
>
>
Thank you for the clarification.

Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
