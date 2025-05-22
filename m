Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29D255E2E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949311; cv=none; b=lpMbahZxUjjeQHH4LBnQx+6fnkCI397hxZKKGJykZqYlme2X0BSsZGJIZ1lWJRRhYxp7uIoFTjllw7NOqMCjfgqp/re4xCA+nShmmupLO6o04otcNkCdVys47hX/omQ054ha84LBErI9eyepFlwzC3exYsyGoCyjLPEpLoZVRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949311; c=relaxed/simple;
	bh=/3i3XuRZg+WgD4lBkNEg7daHyxIphtAN1whMYN62VPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeFEjKZGUndoi9hJC1Z7vWmRuwOBKc9gGROymJlP82QR/Cqqlt+aUroQkhOHyyP5ilSVhUTwDquPFHj7f/4v6ejovg6+fs/j7LcyYkudyTbcRzjoW7KyS0b/33iIoSnBp7Y26ZuyqmmCcHqZC2PSuDVVgiIwIbmp8tzER8LC/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WEGSzQY+; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WEGSzQY+"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d8020ba858so80633985ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949309; x=1748554109; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkmIHtfMnVb0OkhxNQzMO6VwTacuz37IKDgT32/56vk=;
        b=WEGSzQY+2LzLn3SIbTW3tqWk42uldu7uaejLUw40HvUc8VI8Gb9vsuaQ1WwEtHyR/l
         IZHJQO6lSleJ71TlzPPY6I8q0pkghTKqi+ZApEk2RJ86JzOYwsAG07SxRVn9oGcr7Txv
         2tHy2bdHeZ7RqQKv/dBNEA5WA03a5gPDmuAhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949309; x=1748554109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkmIHtfMnVb0OkhxNQzMO6VwTacuz37IKDgT32/56vk=;
        b=BOCOffIrQwuyI0/45slJhYu5riHduzm9lKHxKfsHdgmG/6/tzCFfKDaDxmQgwsI4FM
         KG2obelqE82maye6pVdYHaPThRJwSWkeb9Ai7r8PMvRDdT8VdBx6R1DWo7N4hNVObLoB
         t3IgDM4CLzqv+uK2J2fB5Ul+iC/kEY2vqHCzRDR0f1wCGWNe2CL4Phuk3m0wWZw2Ar1T
         ZGGbJ7fsSgJY8lJGASKSuxUyavGU0Ws1xCqfKdejgMFOZe/Vr6sf2CriqfmrSVKtS/Ms
         /xaOhdfOLVgeuW/sEP9rNeqfjDyFx8qg4MfzOCsLqrS+0UiU/MgRZHNW0EdWZrGr65YG
         Ccog==
X-Forwarded-Encrypted: i=1; AJvYcCW+39YWmPBiJ9UUg2B0Fr7VjNc/YXkfwVbhCLs+xntGOhulOENcKBb4T4/waIMUBGvzZ91+OJqOtGuTzi9DmekgygZWlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj9Z7SEo/hkndsJ4gpwx4hvJ42E9R30unxmkRAVHZFr9GcTAjm
	u0i7mYn9LarV017Ojg1Qgs6kQ599ulwns2MrPSu7GLNYzGvn+U6zm4j2cXplVq2GUgc=
X-Gm-Gg: ASbGncsXMWbnscGSxCc6Qa2t6AII7Knw1Con7zqNrXW20gXCrvM0wW9U9TuP9zXiU7Z
	gCZ3LjctTmonZLZvZUVJodhzoL/TpMsyQo/TD/K1QbswCyklOQMx4qvrOIpLEyX1W0Ka3Mu+W4u
	rlVb9Cgb8YD2lxving/qeXCJuVPPw9DpYcjVRJBe5OTDBc1sQtH5sz+jAMVSOZqxRV26dQHjCIg
	ZmlnYlK9z1ekPn9StwGTUFlLNlyFiDDM5OXct6z66zYFQCMUZYMaZuruDnXf8sbxn+zkkklFzji
	iY4Lbac5Nu2xOjCkMv3h0bJvzL2Mghpc+FnfhxhFZjTPyECHCAgikHSkQz4QPQ==
X-Google-Smtp-Source: AGHT+IHyaPHiavUTnU4czHTaa170yh7eUCpbUqQItARmDudC6XGc7IhtFIet5dGLyhekBpGy0GLYdg==
X-Received: by 2002:a05:6e02:1a0c:b0:3dc:79e5:e6a3 with SMTP id e9e14a558f8ab-3dc932480bamr8922555ab.4.1747949308838;
        Thu, 22 May 2025 14:28:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc7ffeb8a2sm12969655ab.39.2025.05.22.14.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:28:28 -0700 (PDT)
Message-ID: <65743e71-fc2c-4a04-b7f1-b977031a4fb8@linuxfoundation.org>
Date: Thu, 22 May 2025 15:28:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ir_decoder: Convert header comment to proper
 multi-line block
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shuah@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513223242.304716-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513223242.304716-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 16:32, Abdelrahman Fekry wrote:
> The test file for the IR decoder used single-line  comments at the top
> to document its purpose and licensing, which is inconsistent with the style
> used throughout the Linux kernel.
> 
> in this patch i converted the file header to a proper multi-line comment block
> (/*) that aligns with standard kernel practices. This improves
> readability, consistency across selftests, and ensures the license and
> documentation are clearly visible in a familiar format.
> 
> No functional changes have been made.
> 
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Fix these as well.

ERROR: trailing whitespace
#136: FILE: tools/testing/selftests/ir/ir_loopback.c:3:
+ * $

ERROR: trailing whitespace
#137: FILE: tools/testing/selftests/ir/ir_loopback.c:4:
+ * Selftest for IR decoder $

Please fix it and send v2.

thanks,
-- Shuah
