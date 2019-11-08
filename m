Return-Path: <SRS0=i4Xv=ZA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76C3FA372C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 16:25:57 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC7621882
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Nov 2019 16:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eMX3g/Ej"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC7621882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82E2EE89;
	Fri,  8 Nov 2019 16:25:43 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC27FE82
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 16:25:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51ED8710
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Nov 2019 16:25:42 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id s75so5643470ilc.3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 08 Nov 2019 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dwQjkTfEo5yMh2KjfAIAPwSKju01x/vYIT2La5SAaIA=;
	b=eMX3g/EjzOypweNcA48oOtiPYva4EQWEgJJuKt9JhEv3IDAUNpMuL7rPN/vglJopKJ
	rSwogNBf7Cvq0A8VwOMXAIRMkKs9WT5jchAsF+OmEvi8cYAbbhiapdN8r5Y4TwBBewjt
	knlJkJm8WdYhHhloNM7t7CSqnRuCLO9nLdNcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dwQjkTfEo5yMh2KjfAIAPwSKju01x/vYIT2La5SAaIA=;
	b=MMFJHduJO1fzDE7rSNNjzMosM7760JRfATiRXp01A0dcF80XJvPNg4SOV1yb77qVX9
	+5HI7DdeB6w1AH8zXJvDECi96UEedNKWl/1aH4Z7CxSmgMmDtly4kxULjduG8qBpNgfF
	Nmt/eka1ra8inYpbufv0spgGpr/XSdVoCAdYfkfXgvKZOoz9ssM9OjMEbMoSDph5LfM6
	G4jXS+RqRe9eEO26eb6/RUQj0jfH1hZ52X+OIKgzJF3gFBgG/rLvz1Jvl9qYfkrY6Pdt
	3alW2D5FJ1tS/v/Iv2WQgTmN1BLmhGFvqi3+SSA7K5RtdHDh2bsSwtMeFfSN1P/axbY0
	gfMw==
X-Gm-Message-State: APjAAAUeCfd5ylOVyaiSA8Kyz9n1eqT83AM0R3zS8Vt5i+f/yfCH+hdL
	q1LHZj9GgY+6VXeCGNdcx4YFdM3A
X-Google-Smtp-Source: APXvYqy+5R4GLsuIev8Yy2Nzugz/LzGn+LI63xwyEloVOR+4yKTkT4TiqNzpEzFkzLyWPzhbYKOiwg==
X-Received: by 2002:a92:bf08:: with SMTP id z8mr12550558ilh.11.1573230341536; 
	Fri, 08 Nov 2019 08:25:41 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
	[24.9.64.241])
	by smtp.gmail.com with ESMTPSA id d1sm522953iod.16.2019.11.08.08.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2019 08:25:40 -0800 (PST)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
	gregkh@linuxfoundation.org, rfontana@redhat.com,
	kstewart@linuxfoundation.org, tglx@linutronix.de, allison@lohutok.net
References: <20191108035835.7607-1-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d0f23eea-c5e9-8055-49be-73bd0c9ffa11@linuxfoundation.org>
Date: Fri, 8 Nov 2019 09:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108035835.7607-1-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe: Fix ERROR:
	POINTER_LOCATION
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On 11/7/19 8:58 PM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl

Can you include the error message from checkpatch.pl in the commit log
and send v2.

Changes look good to me. I assume checkpatch error disappeared with this
patch.

> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
