Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECE72610
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293250; cv=none; b=I/KjYWG0d3qjen8UUXLIAvHHVO5MQ1pjaLFAS+++VcKyu/dzxbfCazae5lcEaMc11r+785VeCFcg/iH6F2gWdntSROMNcAO4G9ehk6tlPhu3L4bkWty3htEp0FE8uBvVk5iKTZT9omJ0Fj8kFqHHFPw/JpQ7WAluR0thqxeYvLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293250; c=relaxed/simple;
	bh=g1LBwzx+xMWbuxgU7vAOU7Kf6QHWDoK7PDhFsP4hAEM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pUC3kwut1gLPlFB3hADgSDan31FhMvLjoeH9IuPk7zKfNaUA2n8HS6enOvNrQ1FOPjqAszx12vVaMrDHZfSeO/eT8zATfrCUz0XEYo9kcZdSnKbP1ENZ1X2Xo70soE0ikatGYxGsMFJ99xI/bZX+ZsaiRGQrr30Snx8098XDM/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSi/p1BX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSi/p1BX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62B7740346
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sq7DC0LlhdMb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 11:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9B5740099
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B5740099
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QSi/p1BX
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C9B5740099
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 11:14:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-771f3f89952so689829b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293248; x=1756898048; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhyRd88Cb1dzi0Kk3zz4NIhk4NTChPcWAtvNct+hhsc=;
        b=QSi/p1BXLWFPu6ixAom1+QTxjCm5YLmNsy7f+BPnnDuxnZ2tzSQaiTtuHF1CYxsMLl
         CffHiXVDMmzhxvCXwj0vjdqewW3E1SUSjUudoPvpNQZizdVf/AJHkoE/1U3nCVUendPE
         nB1gI1WGpQ64To4e+T9I2MW2AFaPkBBCm8q9SuswVzhKdHEw5zN2rCr8TJP8bInKigDx
         zhxXYbxaYgQbfnnLbObbeevlJ1+M3q+rgiwkNV81rZ/NSOV8SjFkXsaO+0/xwUupxdg/
         TxSjrES3dKaTmCh0S2UEZX1V3Q2tbx+jO8278Khr9jsBwY9L9tOzdGDYdjjf20J01xKe
         Xmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293248; x=1756898048;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lhyRd88Cb1dzi0Kk3zz4NIhk4NTChPcWAtvNct+hhsc=;
        b=OJyten0XNqU7m4R9SWHtjO4SWS/NbC/7JDrB5AciHBJpzqHWxvVAQH2ftudIMkDc26
         k5CB9vmBdOr+mOMXlQ8s3cwCI73N77qn+/RC+oMXRhuGhpcAAjFjf8NFIObHgImKUbix
         KEqaXgpWo7WlIhxKcy6TRsL5s+moNEPDSJ6JeUUS40ku6Snx2UgCNhZyL3TC4X8qTDza
         uRzIjBQSeGSX/1Vc5JuoIthGnYdofP5jrQqu5PX8pLjQkUKl66+j2kio9rlrf5JZIVV3
         fcMnMF9CnpgwarSRpjKcFMdHxLu9RlLkR+F2KKblMZjtIO8U9NOajhntnFE5QY6EdO1p
         UG6Q==
X-Gm-Message-State: AOJu0YyQ8eeZ/buioqZvGEPnPsN50nkSmtwKA1rrn53V9Eq5Vf7ONQtd
	7PBSvTGX3YyKQ3zdDGN2OeXgj+Jnf0/3x+z8XcetLRek1EsJhJ6HbBBB
X-Gm-Gg: ASbGncteIXFszDydJJQsBl4U5Ens5j0xHn9sn1rkyutdtcsiXPmbJa29TIxmUTvYTwY
	SyLLF34kRGRfWpGlYO6+6MBew5V3NVRnZs5JTnZkZguHJVFnULjQTXzuS3YFO5V7RSwaD9g7FMR
	4sebs2V7bYMtmlqN2J0J2AURaAozmqW2ah0ngbxgA8MTwvqUNMIu/SYlinoYX2kMRkyg39cyzCB
	qjawhHtO/YnyHsBlQ6gVHlfPWD25sxY2cq1KQxy8zzexnDUHX4aC2TnqTKpvYtaQTbmSbs4vg/b
	OyDl8Q3skt/imlOXLx4aP5vNC0WxsL4zIXrFccwRFI0RqrXeFqs+RAGeb3T//WdboEtsQhoeDAI
	/kQrgXX7HUmW/aPQvndlpH7Q1aQ24pKL7SyHSDQlD
X-Google-Smtp-Source: AGHT+IHJVGy8bWu09+Nd/ZHKj1w+nJoUf2/1+vEnIG2WERjFNyAm8FwAd2TI6maveS1yOqE+GmwOeA==
X-Received: by 2002:a05:6a20:a12c:b0:240:d246:dacc with SMTP id adf61e73a8af0-2438fad3083mr6881172637.10.1756293247913;
        Wed, 27 Aug 2025 04:14:07 -0700 (PDT)
Received: from [10.146.241.226] ([152.57.137.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7705804a06dsm9565573b3a.112.2025.08.27.04.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 04:14:07 -0700 (PDT)
Message-ID: <e70301b2-9184-4ec2-b8c4-3894a16df2a0@gmail.com>
Date: Wed, 27 Aug 2025 16:43:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org, gregkh@linuxfoundation.org
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
Subject: Thank you for the insightful pre-requisite tasks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Linux Foundation Mentorship Team,

I would like to extend my gratitude for the well-structured pre-requisite task system that was part of the kernel mentorship application process.

While working on the tasks, I gained a deeper understanding of Linux kernel workflows — from creating and refining patches, to engaging with the review process, and appreciating the emphasis on clarity and correctness in commit messages. These exercises gave me valuable, hands-on exposure to the collaborative development practices that make the kernel community so strong.

The process itself was a rewarding learning experience, independent of the outcome. It has already helped me improve my patch submission discipline and build more confidence in navigating kernel source, tooling, and review feedback. These learnings are already helping in understanding patches to subsystems of my interest and now I am able see clearly how kernel gets better in each release by following the mailing list. 

I truly appreciate the mentorship initiative for setting such a thoughtful foundation for aspiring contributors. It has reinforced my motivation to continue learning and contributing actively, and I would be very eager to carry this momentum forward as part of the program.

Thank you again for creating an environment where learning starts from day one.

Best regards,
Bhanuseshukumar Valluri
