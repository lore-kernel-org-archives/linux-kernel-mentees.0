Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4A1F4276
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110558; cv=none; b=X0R8UdcWQEmEU9QVbevFP3l6BNzf9qUJiKRhd+a1tFOj9/kKhS7HbYUL0OdbhNqTLbwoul2mWJ5J4vHiTzJNfNTxMqqw6C++eHy5T/FC1cahtc2k10k8cV1JBi+THWJBaxn7xOK/GwYOwaVjJkr5rL8gPAjiLCKqIldjDEMV5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110558; c=relaxed/simple;
	bh=a/NsExaXFh0brcXTlOrd7Y9Oa2VoHQLFMML8Cnz3x8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CixMQakYP5lTkO6YOLERkO5xxL45fo6DOfnTU0AYptFszJ5sD3etNgoGKlhcCJ8aW7/zoq9m2rEEK5fWUNAPv+E5ceswBb+meQ2aXIlGRcFFx7feybT1CCiJ3zxoEdz5e/Z9UXYMPtenSfwbRllXFlWzXuHovSjbKPfxkqlz8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JRUBab6V; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JRUBab6V"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-852050432a8so741739f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741110555; x=1741715355; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIQyE8Y/Wo/k2rg3+kTPzMkjWvoAdVITwTvTECg9USE=;
        b=JRUBab6VCAxim5apbmz3iGRTHTO2MM5SsQwbtqKa8G/Tj5xpMYDG/9GS37wjc/SOTl
         uajSLb43qYZyX+2rNG7uUoJQyW2sJDMbWc7vfpI9pOXmX9PzHfSgsrF9RZYfdBRMtP0a
         gxt+/7kG9myMvLL43ZUsxqJnyGy54V/gLHVAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741110555; x=1741715355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIQyE8Y/Wo/k2rg3+kTPzMkjWvoAdVITwTvTECg9USE=;
        b=CIUckjCELQE3mgq5TiZ1d71AZ0455UqANr0rECw4xDUO6Oa4zFCGe1qRDeNQDFSPfS
         4qTVr6bxBwt/IH7HaeFVOWKcssZmx4HUJUa3c6m9xr4KpBYZ5eQfEJvH3Tgd2HQOPRUH
         lbfvgLrJzi3PKht6TTCtVHlySSfPeQAnejmoDxyhs2wXYOWHa3h5ZkIRvphG/Tx1Nc90
         n43QV/0U7g6Jxp0AYk143YV+HCj7oL2P1N5o+xtUkEVdJMUuxOxBlXuvcI6HiglldnGG
         ivMLGNHnQ/P4C1aZbwPPkF1w6pbipSnRfAZof5q+zJuNvLWnvinzm9yYphGHdIPWZFOG
         c11g==
X-Forwarded-Encrypted: i=1; AJvYcCVMN+8V4jWKRIeL6d0cy0RJ1EmLJZRy+DrD3SLIr31PV2yM2nMilIv5mEFYBIGV6+GA9qYJg9ZQ3b3s8zxtyfq5eKYORQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc10/ALT5bPX4T/mYXLuYmqgKqPLteEk8pNMTsLTophH+Q9O37
	3abDnr27Yy+kKC+UDn9WDooNaJLSmqEY+Q5UbUnGL4FIIXK6DPu2wIQDoeLeT28=
X-Gm-Gg: ASbGnctuL0ZdU/77tND3FKol1Ccl3uTMzLlW2Jn8owBp1y1IcIkRZJltamVcEsswc7V
	R0DXEUYYV97lLiQ5p1JVj30WjaYFX+Z/7Drv581wZ8RCgPOicgEKWPrHU5dhbRNkZnTQTIxAAdQ
	vvT9Htl44KyYr2H+8uqLv4+bbCXF2cW7aF5P2ppT248NfIXESDVBqNFZg8VTg5981ScNK+CXGQU
	GShF0zLhmVDflsdUYHbSBq/X8pn8CL7u1ntYMewKw3MQo3CFe8NLkTnWWooieDagvJrSHMNDnkZ
	BHmpOoL4UObzGBiS0fONHHC2gr1pBfb0BoGfoZeLgz527V382fFs4f0=
X-Google-Smtp-Source: AGHT+IFe/EZGXyCyM4u01MW+pkyp+aV9q8tehK9bM2e7HADyRWDjWbe46QsDS+SMYJ3Ljp5Ifn3NgA==
X-Received: by 2002:a05:6602:370f:b0:82a:a4e7:5539 with SMTP id ca18e2360f4ac-85aff6300a8mr5572839f.2.1741110555067;
        Tue, 04 Mar 2025 09:49:15 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85875133ebbsm295183839f.28.2025.03.04.09.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:49:14 -0800 (PST)
Message-ID: <a9628a00-2bf3-4d86-8e41-c596079cd8f0@linuxfoundation.org>
Date: Tue, 4 Mar 2025 10:49:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: add 'poll' binary to gitignore
To: Steven Rostedt <rostedt@goodmis.org>,
 Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250210160138.4745-1-bharadwaj.raju777@gmail.com>
 <20250303183625.5acc59ec@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250303183625.5acc59ec@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/25 16:36, Steven Rostedt wrote:
> On Mon, 10 Feb 2025 21:31:34 +0530
> Bharadwaj Raju <bharadwaj.raju777@gmail.com> wrote:
> 
>> When building this test, a binary file 'poll' is
>> generated and should be gitignore'd.
>>
>> Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> 
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> Shuah,
> 
> Can you take this for your tree?
> 
> Possibly with:
> 
> Fixes: 80c3e28528ff9 ("selftests/tracing: Add hist poll() support test")
> 
> So it should go into this rc release.
> 

Ooos - I applied it for next for Linux 6.15-rc1 since it is just
a gitignore change and not critical.

If you think it should go into this rc, I can apply to fixes and
send it for this rc.

thanks,
-- Shuah
