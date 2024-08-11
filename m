Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57731537A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Aug 2024 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723394296; cv=none; b=sSLI9XwRUWdkcoDMHs0fFUuxK2c4ZHPVR+jyJpv9N42XT5jam3yR0RQzZIMDoIoCdp/dgf9s1z4zLHIEpBfiaFHr7KxNOC03+ZWwPvlpeJwdWC0N+Ob0eCfcn/oO8vuo+rdbdNoTX1yenbSW9bvECNzIcJSomxhXYdzWcGQsLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723394296; c=relaxed/simple;
	bh=Y+NTnHleEkqfILvvk4qSrCw+HTpzEe30ogMxm29uIlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3/BJ5n8aSU5dnQFT1ILkZ+T3oQo3W3PLZMVHs3LbTSmpD7zWC5NwnxCvWMNv4TIlElH/ceErE3FhVksICCP/Sc3xp9yI0BJg+jE8+W0idjpYFrUIsZKAcWRyQDI6iV1D3y08KFyYvYzvuv+EFUWZqs46tQBHuUoLqxiwVeY1bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOGnf4eL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOGnf4eL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F002605A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Aug 2024 16:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFQm8g8qc7z1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Aug 2024 16:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=carlos.bilbao.osdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86B0F600CA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B0F600CA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iOGnf4eL
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 86B0F600CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Aug 2024 16:38:14 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-26927819823so2637765fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Aug 2024 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723394293; x=1723999093; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+NTnHleEkqfILvvk4qSrCw+HTpzEe30ogMxm29uIlE=;
        b=iOGnf4eLF34TZX6hEJhqqWrwhyLFS+7hUlMvDIwPyhjFuEUGHq/8xh8h+Gs0nJbw6C
         d4z+F69/ho6QbPjDDdV7Q18mn07HsL0Wa9QdoLbjIG3VsHG/7hEV+pnzUlFcsqE6K7V3
         YCNmsgTYCyoKVLqVKvT0Yya8+/gEAFmEt2nCjQq4ifYpxfbTJDJbK1pIVNBUz4c9K+VO
         XFMBxAt1j6QmMkb5IQZT9PT1TCZK10wVS/1dPuWcsFNmEer7m7fhcWl/8PaFEJlZvmps
         QrADdHjCvq4uoRhWO5TTbzpHREgLP/i7sxdd5Onm1MDJtTUIquuP2CrCjT44bgyxjAlD
         XASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723394293; x=1723999093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+NTnHleEkqfILvvk4qSrCw+HTpzEe30ogMxm29uIlE=;
        b=nqYM+TRfiDzBBoP+JhpqigukfXhHiavOYj7QZpoJf+z70I7+94dJIOReoWxe/ru93q
         AF9tJ7a0ioiweJUrt8z8cFycHr7Wqr1Fu+0Qw9whGRTxNJrLqEJJ8SqvJnQZJs8YWipS
         oRR8Th6fs/XYz7I3ctYfvbu7H4IUZ/yv3M3SR3kNzTgPbyDvnEwmPjnb+lay7OP9MAWW
         3O0OxyyPniVAXbKUtfvTwMKUMuWl9qMvluEzg6l+7WgPIXfPZxIXYFapoMeb00Op1sOt
         88ZhQOrD/7iNggImWRDZvBsWYrjR73hm6t1zmdoeggbIffM9mX6gHXqRWfcEmx3CECsB
         r3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Om/z1kbg3aYCvOHxjPABj7XKlfLRI0KaMkaFoDY5th3WP6Y6TNxG17pRrsibmb1DYn+lrtt5Wsdjb/WEIdPXrMIulYTH+pajAdZY1yLquKzbiicS8MwSIBSjpUdi
X-Gm-Message-State: AOJu0YyoyfmU6YQX4m7W0CAkBbk2ZiXoLyLHiEg+wHc/ctxfSwbPSxi3
	+gRbGCysF3v05MUVe2ZoCTvL4svfw2qTNTt/cA2dVehXE36nCZIh
X-Google-Smtp-Source: AGHT+IFt4OWbki80dHWLXSe8zfKBrJruDBoPMUW3zsS4VoHmKLWspr7mqFgIFh8+tZFFnEYjguPmZA==
X-Received: by 2002:a05:6871:b25:b0:25e:1f67:b3bb with SMTP id 586e51a60fabf-26c62c426e3mr9228165fac.10.1723394293340;
        Sun, 11 Aug 2024 09:38:13 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26c72045928sm1327064fac.4.2024.08.11.09.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 09:38:13 -0700 (PDT)
Message-ID: <17afa9c2-29f9-43e8-8dfe-398eed312cea@gmail.com>
Date: Sun, 11 Aug 2024 11:38:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/sp_SP: Add translation for
 scheduler/sched-bwc.rst
To: Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240810100955.14901-1-sergio.collado@gmail.com>
 <87le14bfm7.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87le14bfm7.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/10/24 09:46, Jonathan Corbet wrote:

> Sergio González Collado <sergio.collado@gmail.com> writes:
>
>> Translate Documentation/scheduler/sched-bwc.rst into Spanish.
>>
>> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
>> ---
>> v1 -> v2 typos corrected
>> ---
>> v2 -> v3 typos corrected
> Thanks for working to improve our docs but ... if you find yourself
> sending three versions in less than 30 minutes, that is perhaps a sign
> that it would be good to slow down just a bit and be a little more
> careful.


This v3 does not have the changes I asked you for v2, Sergio. You'll need
to send v4.


> Thanks,
>
> jon


Thanks,

Carlos

