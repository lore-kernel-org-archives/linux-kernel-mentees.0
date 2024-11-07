Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000F7217324
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995924; cv=none; b=r3lXvFiFQFFO+1yrmUCHUIh6I/qz1687fwt9LbNhjRuzNRD12CPYPCJD0JZNQqq/nM0s6wUx2wUyFQrT/C839rbwFdF0CiA885uS04Fhnk6Cf9k0cRLAcBmz5JMccHjPm3cHPDf4tdCQoSdU9aQmWUqRWEmnCDV8/LCk5wq5NiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995924; c=relaxed/simple;
	bh=NfXPc0KoeadFdO2NlcX/HenhhfnnZL96KLA3VoTh+40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efJYXXAMCK3vCYr0/g0L7Q/reT1d70BPOflOYC8oDRw0XAl5veIx+ER3Dunou6RUc1Mu0wthAjxxGHqOljvWoQk3ZzbB6O1j/bU1evCk3xV84cmw5icfhwhTvU6KE+umRoDiSguY0Zn4csHa3qe0Wv3RMEHsSxuUqWCK+pt2ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P03Vbxhr; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P03Vbxhr"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E41D42A6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_r1bR-6b1xg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 16:12:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A373342977
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A373342977
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=P03Vbxhr
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A373342977
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=d3xSlIqNLv2BbfbJf9pBWeu+m2edFwZPJAVYYpuoIZ0=; b=P03VbxhrcsEfH1OfWf112PNvuo
	ba2WxcL4nnoJBm1F0memqsCnsLXkjsJErdoMV4bN6KQC8HvdsOSdiMIBuTOcSLFilnl8kFZ9LgJ1A
	2fYoaP2KwtXcPw2Ai145PEkvWxxHW3N8HBTJykwCWy2dZQLIgnh+mV0+cjMDthA+eoreDC3lJg1cl
	TTVQiACxzUpJYS69KeovrSNW0FzKlkl5i6jfUSM2p0wwf/l9V0af+QcvBSXmiapWcj1sE9b/MQNeG
	vu+wSFqjFwHxRMwwtwyfQBDtyhgUhMS1Fzr2anEVaxH6ES6jASPfyY2wCvASVhB6oYNfFrqTDwX48
	ZITi72pQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t956t-00000006wwX-3nJo;
	Thu, 07 Nov 2024 16:11:52 +0000
Message-ID: <464b1628-957a-485b-87d9-47636491de22@infradead.org>
Date: Thu, 7 Nov 2024 08:11:45 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/mm: Fix spelling in hwpoison.rst
To: Abhinav Saxena <xandfury@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Richard Weinberger <richard@nod.at>
References: <20241107063042.106228-1-xandfury@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241107063042.106228-1-xandfury@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/6/24 10:30 PM, Abhinav Saxena wrote:
> Fix spelling of "focusses" to "focuses" to follow standard English usage.
> 

We accept British spellings.

internet says:
"Both spellings are acceptable in American and British English."

"Focused" is the past tense of the verb "focus" and can also be used as an adjective to mean clear. For example, "She had a focused approach in training". 
The plural of the noun "focus" can be either "foci" or "focuses". 

    FOCUS definition and meaning | Collins English Dictionary
    ), plural, 3rd person singular present tense focuses , focusing , past tense, past participle focused language note: The spellings...
    Collins Dictionary

Focussed vs Focused | Spelling, Explanation & Examples - QuillBot
Sep 10, 2024 — Published on September 10, 2024 by Trevor Marshall, MSc. Revised on October 29, 2024. Both focussed and focused are ac...
QuillBot
Spelling Tips: Focused or Focussed? | Australia's Best Writing Tips
May 7, 2020 — Summary: Focused or Focussed? 'Focused' and 'focussed' are two spellings of the same word: Focused (one 's') is the sta...
getproofed.com.au

    Show all

"
> Checkpatch.pl reported this issue.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  Documentation/mm/hwpoison.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.rst
> index 483b72aa7c11..dd02fae484dc 100644
> --- a/Documentation/mm/hwpoison.rst
> +++ b/Documentation/mm/hwpoison.rst
> @@ -17,7 +17,7 @@ To quote the overview comment::
>  	hardware as being corrupted usually due to a 2bit ECC memory or cache
>  	failure.
>  
> -	This focusses on pages detected as corrupted in the background.
> +	This focuses on pages detected as corrupted in the background.
>  	When the current CPU tries to consume corruption the currently
>  	running process can just be killed directly instead. This implies
>  	that if the error cannot be handled for some reason it's safe to

-- 
~Randy

