Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DBBC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 15:27:14 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029E7206A3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 15:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="El+UJg3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029E7206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EAAD2B2F;
	Thu,  7 Nov 2019 15:27:12 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC62EAD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 15:27:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4F33E189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 15:27:11 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c19so2310737otr.11
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 07 Nov 2019 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8g1aBFiYTmWEUxRehSfcBGlHDC3Wdg2vfhplc/SgYRc=;
	b=El+UJg3znyOjiczqLA01Cbp8+y6ZUuXLHeACCBHqHQqEcqgxa7Cpdn0OPQFZIqa16P
	AKU3uEJvsY8kelIbrulz3ibjP36cNF9LO/d22OnvLjqeFS9s63APyzwFPl7IdPTUYbaf
	FXKkBhLtGL2AWoPRWtvvC8zzouzbgpsuTbnHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8g1aBFiYTmWEUxRehSfcBGlHDC3Wdg2vfhplc/SgYRc=;
	b=ev+qMeXA2+M15jezvk9ZZfCs3od5158J7qlnW56ig+vDFZZmWYn7zTRH5xOYmUlvUx
	gzCGRGDeckkyVeeakMbQHsWXJoUrtL5s3r1joDRdinCO7bD3bypP12dPnNKSc9KVNfmW
	ZS5H6WQMY5NbLN0C5lonpNXEFPW0zDBkiK24PaZDGC8DnobiKZH6x7Gfizd690nXnqjh
	w7GTAnF3nfA7cotKwpkkeQDAWA1xGEnjVnnkbFeEia4mY9TTM9k/jg1JpRbcEGeposR6
	SPbepI/bgtZTAx3HFiG1ZyYHb1N3SbPuHPrFHq5e641aEXGWqW5zh7hDvMpZidiYZmoH
	fQXA==
X-Gm-Message-State: APjAAAVbPdu7kLeqiLqDmP7n+cpOc8WjxQM28rVPkLxEhCWOUmYctpIo
	87Npq7qXEy7gOvUnHN/AO4P5E8cgjYnuSQ==
X-Google-Smtp-Source: APXvYqxO0fEZ+NWGy9+AqOu54ywUZsJw9t0Nd8AkWlyrrkHWhx4tQ8p5ZCzle8Oe12S8pcE+t3qjpQ==
X-Received: by 2002:a05:6830:1611:: with SMTP id
	g17mr3565233otr.29.1573140430377; 
	Thu, 07 Nov 2019 07:27:10 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
	[24.9.64.241])
	by smtp.gmail.com with ESMTPSA id 2sm864034ots.21.2019.11.07.07.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2019 07:27:09 -0800 (PST)
To: Daniel Lima de Almeida <dwlsalmeida@gmail.com>,
	"linux-kernel-mentees@lists.linuxfoundation.org"
	<linux-kernel-mentees@lists.linuxfoundation.org>
References: <1EAC4E5D-F15C-4F29-A9D8-24D42EE212CF@getmailspring.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <260ad9b2-94a3-ddc1-89bc-37f334f8b947@linuxfoundation.org>
Date: Thu, 7 Nov 2019 08:27:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1EAC4E5D-F15C-4F29-A9D8-24D42EE212CF@getmailspring.com>
Content-Language: en-US
Subject: Re: [Linux-kernel-mentees] I am working on converting
	Documentation/DMA-API.txt to .rst
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

On 11/6/19 6:51 PM, Daniel Lima de Almeida wrote:
> 
> Hello everyone!
> 
> After checking the logs for this mailing list I was unable to locate 
> patches to convert Documentation/DMA-API.txt to reStructuredText, 
> therefore I am working on that now.
> 
> Thank you.
> Sent from Mailspring

Hi Daniel!

Thanks so much for coordinating with others on the documentation work
and giving us heads up on your plans.

This will help reduce duplicated efforts.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
