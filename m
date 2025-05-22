Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EE2561CB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949685; cv=none; b=cFAL9SVBKru3vLhfy5CnO6prDB8DBapstoiDzRoNmeTN1vaUZL284M/9IpTlRlVbkXZihJRy5/+kQAUGt5SS9CLz2xM2SVScPf65bFQ16ceJXM/QJ/jvhTT+eU4Cb9DVaY1AglUUKGqMayXkTMcoNQXz1SE+DnGFsKcmW6ClX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949685; c=relaxed/simple;
	bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HN4bvPHBxIlozk2aaDXor2v/Pt2VYiCZQjdIO8ffgXgi3XQKOy2/phXOGoOD1uLDE/ZBE/8fafc/CIKw0hcCm38EyXH+3lIh/yD9oEJ5X1gmf+1K45ULS7gsoStwPIaxK2lMIhsjTpTzFlVkZOCf9F+LJlNvQ2ESbWAgZn1hVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WTiiVumv; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WTiiVumv"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86a55400875so274603039f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949683; x=1748554483; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
        b=WTiiVumvh2rI0O21bp2Sim7+oQZGOdf0doyK7OZz90n2l+bdZ0cq1M78/QLaUP9FCG
         C4JxOnWSPqY6Sv0/exhWLuMZQya8FW7OtpIVfIhjAE4KbUL3WEaqbHeLKYUxAPtvOwoJ
         34PiUUSzskzLvZ82uYmE+JF0Rr6gnbJCc726s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949683; x=1748554483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
        b=jib+egHF9cEMVFKO/dPL9nlW+HZOZYK01PZhoFJBT9DnKP6Lc4/E7NdxiSAFCx1bD5
         VqqH3g6Na0Rn088T4CN0hKa9r6SODfdueziHZeb7Hvooz0hga4iHWCrZCU2AwxGU9h5G
         TFCM+KF++zzxWySluODEIKynHI65keTL6MVyK7w3rrEH7yHQDPmeX41jYaC4eMOs4K4Q
         lEEVnp7oP27pbBO7ND1u63qd+tXd9LLGLq2oxJx0eymgn+bv0jUuAvhYS7Sl0LEJNTu8
         74bS0XYt9K6n/PBgoGXG49PzMNgCZ+M/4QJXXIfZoUQe3DIQVrIdROYx7cFHmV6uXsbY
         fhgg==
X-Gm-Message-State: AOJu0YzVaFfse5dSvI6Lk+gcLso2+bFGac/ltnHAXvVVJUcmYdQh8zAF
	+ut/n0I3obaXUWy8arC3JmbOjKiR+j5NPz7Ovh5HvPFAuO0wUCQZmf+a/rjJVtkv4m7kXUyNSPz
	DKwbo
X-Gm-Gg: ASbGncuTw5CYvjIgQ2lDCrlIy5U8EpIx9AeOvSYzzHihQOOSHnhmhrQs9NonE5KOCaM
	bVKGHFA9KPgEfli7Bg4Vx6qcuPMljZfDV9CjV+VLh6HTi4kht9XM7nbBa5yodGlNT5+fTMAyExi
	YXnO/LgpQWWPsDu+Wa3ZOkpgqZ28L+Njv0j7yj0lmfjawyAmVxo3cf/R3g1oleDJOO032/uojv8
	3ZqnQ1gt3TXlkeNxzxi0gzZqxMRK3+UFoVEpwn0p3lENOlkYVXDhMfJBasOM7gZv057KwwR+2xD
	cC0hF36Uvju0q44Lv1IiQAbXVGT67hbEMHe97zzyZtIrMEfG+qepIH9DVSEo5w==
X-Google-Smtp-Source: AGHT+IFOP2EK9yyZB7cTqFwEeuUmHdSfOrY/lJgHKzpzyGNmW3X83mfZIE6QNHvPYOhd2PwPrc1cKQ==
X-Received: by 2002:a05:6602:7284:b0:86a:26c8:4ba0 with SMTP id ca18e2360f4ac-86a26c84ca2mr3518244939f.8.1747949682930;
        Thu, 22 May 2025 14:34:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4afb56sm3342642173.117.2025.05.22.14.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:34:42 -0700 (PDT)
Message-ID: <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Date: Thu, 22 May 2025 15:34:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: fix "memebers" typo in
 filesystems/mount-notify
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 08:48, Hendrik Hamerlinck wrote:
> Corrects a spelling mistake "memebers" instead of "members" in
> tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c

Change the shortlog to indicate test clearly. Check a few logs
for this file for examples. Here is how the correct format looks
like:

selftests: filesystems: fix "memebers" typo in mount-notify

SZend v2 with this correction.

thanks,
-- Shuah
