Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68161FEE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716829236; cv=none; b=Z7RJA7Bu7AJnW/STi2qV3JAcQrYMmGIZFIbNJVyf+JDFUtQNvvq4US6/CoHGohhjSlVCOPgfTU2RyfUml1WxnA065XKpdXtXjctZWw/Fsl7sEUKsNG0oYU1jY3l8HINrwufPWUIIY2p6JZ3cYQxPmWOYyRthSoQPca/Bd+x76DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716829236; c=relaxed/simple;
	bh=8MLNb2bRcbp/oLUAripV2zX69ZK7bOk3ntrl8bKbv7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDWl9/tNEgkzswm8WkEbtYlzYP92l1kRyGATAmm0H1bU2SKuzc4ACX+JVJMX16G73uxOnvyMcPABvc4eazsaQlgT3zIfgRaUuV5dZJilomuCVtH1Ltd1uco+wOs4KOuG6kK80xAtIFRxi/6v2QNB8mgWqWLLPLmZMpFzMukyJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2VNyN7j; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2VNyN7j"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181FA6070D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 17:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seVaDGD6SGPR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 17:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=pmnxis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B6D860708
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6D860708
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q2VNyN7j
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6B6D860708
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 17:00:34 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f45d6500b4so3375ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716829234; x=1717434034; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnYD2vB9if3b0Pw8B9yj3OZSPzEecAxuxqjy5zfQk70=;
        b=Q2VNyN7j+cjIGVbQK5EaHPAa7dGQsmfyzZWZJiMOIFN+hCT9Nn+ZJlc8nIBZx2uOWx
         5DEIGMkLHBfx5uUARltqlqILVEALGh9JE0GvzMTpr+9yY3jxFWAqnECH1QM5deohlUeF
         kjW6z2HsRv6PRItmS7jiM/k9665ba8O5IQ4Y42n8Stn3mpEBZEWQQ9/+K3a5THOQ4dxO
         iQWQxL5/Sqwu8MHJuSyEK+7Thhh9A87lxT9Sen7joIlXCSzNnoWF/S3V2RE/O9R2yFSM
         cH8qUVJUA0cV9506KYXda1xDPjhCxqsvD3gh5edxEkHv0FnA6dSip1RHw1Zjj6M+N3bs
         fuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716829234; x=1717434034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnYD2vB9if3b0Pw8B9yj3OZSPzEecAxuxqjy5zfQk70=;
        b=n7Trvy6sh815+jBOIiOunTnvm/ZzsHwZFGTOdXpx626f9NOAYsMtmU8MR/4qIhvKiU
         tIEe+3XgFIG+xNbqlYnNzZ55nPQKM7xYSi3UgOWj/rUdt6raSVPplD15J32b1lY0VFcP
         5zvv6tzGPMCSRATucdibVdyaTG7YAEZLHzdhAQF5wzQeFSJhblJhU3ESDiztrbGdBGw7
         /Ize/bcjIowA2QZRVqZoRP3NcH7hZuYXMRyRAWkYG+6dC2vYe5nxqRrBao5hSzlzz7N1
         BVDlEe8dM/2w+Y1yHMUhTnZ+dADIGa02aEPdAB7vfh5Lg187CEbLjmiHYh4fV8HxhxSQ
         EryA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJShsk9shJRAdb8eRo8Y+vdGA6HBqZtRoZu4HUV7ZyasIGilH82Ka6jg1IlBJq0zeugSKlS3IxPFPdMIlezSWMXJX+IbAbhluK578MgxT7xsG9cSlfAyh1fteioqQ
X-Gm-Message-State: AOJu0YyWJZ+qVp2oK1EUVc15fLy7+vLEqzDpphoPfVDM1XjWVRSNE9yK
	Fs7ZzngCnJ68eDGPWxC5oh4Hf4cLmj7bcFlhqv7+McOB36hH5Dlq
X-Google-Smtp-Source: AGHT+IGmgWeyiRNe9+u2BnAS1T0LPl+16VQSq5K+KtGP+MlwlyWvOvoH3Tc4mPXyjH2k8Qjrfmh4Hg==
X-Received: by 2002:a17:902:c94d:b0:1f4:98f4:4763 with SMTP id d9443c01a7336-1f498f449a0mr38374615ad.53.1716829233424;
        Mon, 27 May 2024 10:00:33 -0700 (PDT)
Received: from [10.59.0.127] ([210.178.66.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c99d23asm65061795ad.208.2024.05.27.10.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 10:00:33 -0700 (PDT)
Message-ID: <f8a8c06a-9dcd-437f-ab75-d0ddb608662f@gmail.com>
Date: Tue, 28 May 2024 02:00:28 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: cve Korean translation
Content-Language: ko
To: Jonathan Corbet <corbet@lwn.net>, Yunseong Kim <yskelg@gmail.com>
Cc: skhan@linuxfoundation.org, Austin Kim <austindh.kim@gmail.com>,
 shjy180909@gmail.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527103003.29318-1-yskelg@gmail.com>
 <87ikyzpgqz.fsf@meer.lwn.net>
 <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
 <87o78rnz3a.fsf@meer.lwn.net>
 <8880b0ec-9315-428e-b9c4-e578690d3c08@gmail.com>
 <877cffnw2i.fsf@meer.lwn.net>
From: Jinwoo Park <pmnxis@gmail.com>
In-Reply-To: <877cffnw2i.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2024. 5. 27. 오후 11:55, Jonathan Corbet wrote:
> It does look like the patch was reviewed, but no Reviewed-by tag was
> offered.  *Never* apply a Reviewed-by tag that has not been explicitly
> given to you.
> 
> Jinwoo, would you like to offer that tag for this patch?

Thank you for taking a close look at the content and flow of the patch.
Jon, yes I want to offer and apply Reviewd-by tag for the patch.

Thanks Regards,
Jinwoo Park
