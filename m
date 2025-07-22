Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA31E5B69
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200576; cv=none; b=V6UHuGPSsm+Ah7IcXgV2c8i9+5hjL7pq9MR+hc1gKi5486KBqLBjN7dH7mbJnKsLsOQj0WMxbDisPPmGwf0AcNxH8f0qau/AEQ6Qm/BZah12u57uacEWyJjae1iYXt+sklXlIRek5ypdUYwaZUkgqnfeVBq7Cqrjriy0Zh/vW0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200576; c=relaxed/simple;
	bh=Xpmb9ROCj6DTOjSlYvPf5fHme0meNeJxpaM7AWv30SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Deu/LBhIaRt4o9Px6KfXAwwBTGuGkiFUBgu6fg4dZnxBoLSubRaDtcW3ZSK/KEViYCUh/vYVPCl0zjY4rXZifmbFZkuiPAnDMq7FZc4PRaVF82zcYF5HUWR9K1tR+Zwk1pPPOl8I+ijDUAtCoTV2+XnMBRxjnQVJVMxhYmWY0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJIUc6Ck; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJIUc6Ck"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ffaf8283faso5348181fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753200574; x=1753805374; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xpmb9ROCj6DTOjSlYvPf5fHme0meNeJxpaM7AWv30SA=;
        b=bJIUc6Ckph7vvbU7CDZ0bJRfnCNR3aOZIwH/aljRqmQU1MNtL0JkPpiQRtujtx77a1
         VM9OZiz/CgXBTAj3fBcog4aSnhRM/IN9GvUI2OuR0N9SieiHpRor4g6eDcVnozFzyRkZ
         jxfAl2XSY/KvCWJO9ru+EfTwsNVdTPullDeQ4GfJ1MvhoPs3JVK4wgYI8m0Cro3mizKM
         n/Jle3Q/ipHDq7KW4h/v2XB4OWg0AWpl2X9qp1h2StKM7kqy6JQ9AWOHDL1KRHfATbLu
         VVLHnvGccYF0ER9jqSf0YWM/+Yk/jWoraAbq5EW/y2dhbBeJxj3FgFlYI8BYStPr1/Kk
         mJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200574; x=1753805374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xpmb9ROCj6DTOjSlYvPf5fHme0meNeJxpaM7AWv30SA=;
        b=PYfy2L4Jj7bja1PZ+J32Mm58/f6yY/TLomP5caJHhBYEGwV4m0ar3Z7CrOyQSiie1Z
         Yg+PRWiQi2Jum9V7mqFIl+my/6YSonYLEcK72ma8NfenNZq2CerlOfcgbtYXnx8w59VC
         RrwRKMWdIPySFWoZ1+OBEUKAzeLPUo6Vys1QkRoKVWWiJY5NbTf0f+8ZawRrqpCWnKBY
         9opCuEq6s3dTKRsZVhQvkw/oKwLjwLF62exMMG9rxn0XR39WkqIlfRO4kBEcgv7lmBSZ
         eTIQcO3dOR8nNUdlqbsJQAVggdiQQfmgfXBBNaOQuLqJNGyX/5qyrD27ptuphPuF0eCP
         4Apw==
X-Forwarded-Encrypted: i=1; AJvYcCVxHC4DHJut84MfJzoMRMBnUn2ly5mrNfKZsGpYwhzIDzQIZkTEeBf3R4uZh8CRAqUiNIM8VAUV+Gi4WYR+JLMqx4sCeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2kyL2iNuw5XgCImwi0NeQVAULbWxZ8SkjbiQskHwT6G8TMfue
	3i8KNxFOsUPICliCYal6s1ZsrplRm/HUSHrsiVOzYn/Hu1jCMeDKESk61eunYKXG3FOqxegWfvv
	VmJSGWPArGzFteR/z94fiGJyo3WMW76M=
X-Gm-Gg: ASbGncsVs41XAc1+o3UOJaEqNVcUTouM7l1VcA+sze+Rfuq7KWIwAXPRsdRGutxc3Zq
	dZiWPdujZRsD++YkESLMUC6NtfJPLq9lmvC15zxKVA/n3NArZx7wp3YGkrQUcOWQeajnQo7tRBx
	3SHxO/ufx89df5qbrlDV50bmtqPfxrDAvL2bqf7G4IbO+nmoEeBLxgAP5TM0stCD1U+xd2VqVdy
	1RulxQvkDHkaKnEkks=
X-Google-Smtp-Source: AGHT+IEXX/MQb/klW4ioYjUPOHqvEZfTQrL6aML2ZjUm/97x2I8ijv8xRL9h1/TGGJ/ff8ffSELXChSXtnh1LZ1mDhg=
X-Received: by 2002:a05:6871:7c18:b0:2c2:3e24:9b54 with SMTP id
 586e51a60fabf-2ffb225ee4amr17171057fac.11.1753200574415; Tue, 22 Jul 2025
 09:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250713151224.43764-1-suchitkarunakaran@gmail.com> <aHqMXz9KOpRuQNcj@google.com>
In-Reply-To: <aHqMXz9KOpRuQNcj@google.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 22 Jul 2025 21:39:23 +0530
X-Gm-Features: Ac12FXwUW2MtBwIhN0nWiSCW6-jxhnHHxg_7CDT_NF88DxEnFMN-yrxdBTqYNmA
Message-ID: <CAO9wTFgR6HPe28eVhXm7_CPPdiQqD-E3qarFu5xV3wg5E+Eh2g@mail.gmail.com>
Subject: Re: [PATCH v2] perf stat: Fix JSON output formatting in iostat_prefix()
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jul 2025 at 23:33, Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hello,
>
> On Sun, Jul 13, 2025 at 08:42:24PM +0530, Suchit Karunakaran wrote:
> > The iostat_prefix() function previously included a TODO noting that its output
> > format was incorrect in JSON mode. This patch corrects that by conditionally
> > formatting the prefix string based on the output mode specified in
> > perf_stat_config. Note, I didn't test it since my system doesn't support
> > it.
>
> Can any Intel folks verify this with combination of various options
> like -x/-j, -I and --metric-only?
>
> Thanks,
> Namhyung
>

Just following up on this patch to see if anyone had a chance to test it. Thanks
