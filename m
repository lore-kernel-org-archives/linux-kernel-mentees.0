Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1E1DFDA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039278; cv=none; b=otDZhMPvX+SexkCAmf3kbKPEFYONdWkaa535zLr5bejEcFp+koNA8mHlnRBR2ynnE8KbpiOJKJeRp6IkDYOS0Iq1TtEIKfOfBiC9nC8gr+PpF4m7aPj1o6aA02YZ42ityM8cugpawRJijVyUZymUJ3ZGuvRL/GeOMPVTQNxKrHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039278; c=relaxed/simple;
	bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aom8OjzO6j4rMBaRQozeSZZH8QjqeTuZ3VJo5BndyM14GqirnQa5ZpO97NRFhl+fxrflNnpK/yE3a6D6kGteawuDkf6Jjo+X+dSlFjXlqxcHAI99ke42NLhl1H9YuV2wzXo08LJ1rOulCq6roYaGen80fMj7aX3dQURnFH3/1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fpIYsatq; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fpIYsatq"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F30F40BA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6Ts9b03nChj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Apr 2025 18:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CD8B40B96
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD8B40B96
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fpIYsatq
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3CD8B40B96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:54:34 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-86192b6946eso6157539f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746039274; x=1746644074; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
        b=fpIYsatqeLNkdinenRT1czX5Dd5TKa1D32kFZNlSTCoY0Ld2AEyfHcV2RDfjDN59JY
         HNPc/0sl6eeNkoiN6DAwy9IcE1m8EH9QNE/N4RqyVHA9Cfl/lIZuLvlZ67p8sij2priw
         FHjNBM9DRXHjsRxt71SdEZIyRMqyibpT9cgdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039274; x=1746644074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
        b=eME/c60nQYlz2EZqrlN9B7Lz0fG4eoK6Z6wvb6+T/kh6zri9YZyf/SsajUYnCUg7Nu
         GenFYHNDXZ/zC/PVl52xzRLElhm6z55TmC5m8plErlRqYPA9nz3GT1BLte+3109ZjJpX
         YFciS1xiz8UL7aq6omiqE0Oo9hD8KGFsOgFXk3ci+H+gNtV03w460i7GUcZvqWJUA5hC
         vg5ulyBOyFkQPGPi+OziIW9z2lh5paBGAi7DZChIdTUQuvWv3j6mv+9qLOcYio4Jt4Ky
         Qx0gs/f1CQG3JsT7eMUDG1uYcdSsrIo3tbUvYoUk2OY6tzwjYpgqB2KW0/7tUAdzSx6S
         37yg==
X-Gm-Message-State: AOJu0YzWNAXq65ujbqYAQbD1w7FEpYoX+jL9RQ7VDXuISHRRv44dwOY5
	OoV1rxVS7tkhJ+mURnqSJXsLoZq4beGAw51tqmJKOAuIM0UqeOpwXCYLiWfbTxjy+Q==
X-Gm-Gg: ASbGncshsGgu/EGjqMf3ETS2spAsUj9vT7B1MeCkk9LvXk4oDb15I73ZgFfxmaFEF5W
	LEIKJzz+C7RxNuScGNMg36Jye597cQc/3xi06IAMWIXzsFBmC4MX70l8S3e+/PgEOx+3/DMVeHG
	rmQXow2U0gP1PhZ3NLx1UgWLKJfOqglWwelRnx9FH8R1s6YHusHc4Q/KsuHd7xqoj/FtFfAYat3
	zwkXIULx4kBiNOJ547hxjjsjxmmA9CtwToTeSG7B7J6u10eA3n9cEC5eibC2iemD6HG/bvl8r9R
	6KVFsNhwnb+/R9ePghbE5eUYOdzXycm5F9e+16BLa8T3yExN8Dhx76fIxhLkCw==
X-Google-Smtp-Source: AGHT+IE9D9dHDIH8+xKtHJUGmzEQO0mhEEj08arKdlDwswO8uWorHYe0lGPtYSS7JWukag+pUyvaug==
X-Received: by 2002:a05:6602:36ca:b0:861:1ba3:3e50 with SMTP id ca18e2360f4ac-864a2051d04mr59173839f.0.1746039273897;
        Wed, 30 Apr 2025 11:54:33 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c19572bsm81370839f.37.2025.04.30.11.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:54:33 -0700 (PDT)
Message-ID: <a0ae3ab9-14e2-4ec4-ac7e-a9ad59955df4@linuxfoundation.org>
Date: Wed, 30 Apr 2025 12:54:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix spelling mistakes in HID documentation
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
References: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/25 00:24, Ankit Chauhan wrote:
> This commit fixes spelling mistakes in the HID documentation:

The change log has to read in imperative mood:

"Fix spelling mistakes in the HID documentation" is the right
phrasing.

Make sure to send the patch to maintainers. You have to send
the patch to everybody get_maintainer.pl tell you to.

thanks,
-- Shuah
