Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28B352FD0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757450601; cv=none; b=PaXoHm9+VqW/k7u89oJXp0QXT55Q15C4wl5U0pTTo5jn7U2NMqmCpHW7vO2BKGWIiUVakPmh64TZllty/pETRQkpGvnjw6FisYrZgTGcAnNWSvEpftWq+p7p7k7K08Ccr0o/Td1RZHtCWWHTjyw/iRAWPrDPDgX7crH4gKDETMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757450601; c=relaxed/simple;
	bh=omHf3tUOHLTqPHxBTKVIZTffKN+uguSMK4T50Z5lSr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkhyjlnGxtkTeP0FigvUXY4e3uhqXM2YGpmB63ubSjSxz2L4e3WpIDm8sTH0GKHTxwjYbJKWDnENBbGIapd3XToZFSzHuQ+yXmnEcTpO5iCpkuqN94D2hiSO6HF+ALTtKuD8pMH1t1fu/glfE991OycXOnoKrrOl/E8vL2cKzdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V+/tqtKs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V+/tqtKs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 433DE400EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 20:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJLrhyvnSQDK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Sep 2025 20:43:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F79A400B1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F79A400B1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=V+/tqtKs
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4F79A400B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Sep 2025 20:43:18 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3f660084016so36711875ab.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 09 Sep 2025 13:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757450597; x=1758055397; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cc8dl6Q1sfuH6wMV0fcUjMYcGGC6LCXn3isXSie8b0=;
        b=V+/tqtKsDVEsHJcO/CvzeCf9cXYuOaO58owl+A/Vqm8D/RxZnZHjYFsTTEFDG5tyHE
         nx4D85BasxX6h5lnh6GaGeRu4b4TX4muAzKFrUH7JmzqFqBmxGndtzG4Z2jE0Jo0+FFZ
         oxwbyIHWtHwRVGAC1RIZfsIWIFP1N8gXRvsVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757450597; x=1758055397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cc8dl6Q1sfuH6wMV0fcUjMYcGGC6LCXn3isXSie8b0=;
        b=MA4BwcD1GEhNjkFLAJC1vG+who7tQ5yxn2dXBCHiRMJWLHO3bUnewYH4V/whM3Uw0R
         ktV1PTI48V4n4zEV4tyvd63HTYjOLzVimWJNXaPmxKTJDeMfdK7PTzQ1jDYgmstS9QqR
         6MLDnDfwJ03rbO0//9254lcEvPX0F7Wftt0+5TGXNTVRReoTlkqw/h7gMSfWC6T02xXM
         Buj09RJhTBbL/Ntc2DsUx+djWFdfu9Pe9sbtooHJD1sXqIUGBjK+6NnjAIuTQX4BWo6T
         PimP352cJhRGuIev/pmcauxwjtAbCVYvq6amk5/E0p9X/NvtNWhn52wqvIr4rk2U2Y9y
         ttPg==
X-Gm-Message-State: AOJu0Yy5U1F4mDIS50qlsbFmLvP+kC9CIr9naFBX9nKkGDOtnWsjGwSA
	7N13b4kcZ866wtixyt3PEOXlHNT7Xu9N4kssZlj9T9yfDrcqw96F97coZBUhkIpboH4Zfg==
X-Gm-Gg: ASbGncsmV/3uBm+sWRvDop91DmIlRol5ARaWgh+xa4aJlFMGDb6NYnvS3ZMOlrwo+XV
	0gt4G4Qnqf4cMmLcVxDK4lShHiuqRm6gpXHbGgrxYu/CspRiuq6Enw9X1/564/3/AfPDgtm3olI
	6W6+oyg4gZYsXbTq+1/nOYSFO5ZoiQ9rnha+y2y05qTPozpS2sCrFHTyY9CfqZ1vKn3XmhqQTRB
	FuGv5qFyARcakmoXcJ3AXnWRGfr8LPOGtItYUW6hZ810JzWWKGv4MGNdoYYuR3yixHIs2/YDGS7
	Rbq2Q75n+y/hCIXqFTiU/7G7UuCUaJ1FcQfyT49aQcE49OMmHOEYV6WHudz8awX02h0OK00Kzbs
	AS0rNZJiSCFinURwtKbLcRac+QF8xCD2Bsqc=
X-Google-Smtp-Source: AGHT+IEOJ8p8a3gMgmD2wj7hrsLgGMXo2NW3gRR45dQTQGWRGUWiGbqhdbop2VlzfoZ3tkXDa2Vf3Q==
X-Received: by 2002:a05:6e02:156d:b0:415:2421:f5f7 with SMTP id e9e14a558f8ab-4152421f916mr21113325ab.19.1757450597084;
        Tue, 09 Sep 2025 13:43:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-40d221638absm17760925ab.34.2025.09.09.13.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 13:43:16 -0700 (PDT)
Message-ID: <a3456af5-f90f-4f85-9071-230c6e9950df@linuxfoundation.org>
Date: Tue, 9 Sep 2025 14:43:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thank you for the insightful pre-requisite tasks
To: bhanuseshukumar <bhanuseshukumar@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, gregkh@linuxfoundation.org
References: <e70301b2-9184-4ec2-b8c4-3894a16df2a0@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e70301b2-9184-4ec2-b8c4-3894a16df2a0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/25 05:13, bhanuseshukumar wrote:
> Dear Linux Foundation Mentorship Team,
> 
> I would like to extend my gratitude for the well-structured pre-requisite task system that was part of the kernel mentorship application process.
> 
> While working on the tasks, I gained a deeper understanding of Linux kernel workflows — from creating and refining patches, to engaging with the review process, and appreciating the emphasis on clarity and correctness in commit messages. These exercises gave me valuable, hands-on exposure to the collaborative development practices that make the kernel community so strong.
> 
> The process itself was a rewarding learning experience, independent of the outcome. It has already helped me improve my patch submission discipline and build more confidence in navigating kernel source, tooling, and review feedback. These learnings are already helping in understanding patches to subsystems of my interest and now I am able see clearly how kernel gets better in each release by following the mailing list.
  
> 
> I truly appreciate the mentorship initiative for setting such a thoughtful foundation for aspiring contributors. It has reinforced my motivation to continue learning and contributing actively, and I would be very eager to carry this momentum forward as part of the program.
> 
> Thank you again for creating an environment where learning starts from day one.

Glad to hear the application process has helped you learn.

thanks,
-- Shuah
