Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E326E71C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135889; cv=none; b=tovKUxlZwkI6LJRuxUVvJAlCqyN1CZctDDw4THFknWPwEws39j576ZDop5PEa1zfrJNRAXKpLjjN5d6hgvtzcYpIfJys9etmmwIEcQ15vv1jDvIeTFBzwhsp+2/3aqSROrC6NBnJFE12eqLacwD4EoGFKllqNjNMBkSgNy/rv/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135889; c=relaxed/simple;
	bh=rUnr8qT/4XF12hJarI25ppPhefyEIGHQOZ/WpWPVrKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxPUpc5VYQaYG2fZ0Vmc0JKcfa0QhRBqhNHq9uBzbtPoeo2UwGacbnGD70PkSysz1HhcEv67IijJCp68KS2iGrCeXc3nHh7p/bndp29TLggXVpO8Zj/HWBITzYEVxuW3Ar2gD/guGiG+zGrZRbjg98UoYQUdoAf5IKY29OaPm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SV8/V/Cc; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV8/V/Cc"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so2944748e0c.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761135887; x=1761740687; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZd3zxf5Nou1SN92i7qbzIMpgjWXvQnZyGFhzFz0euA=;
        b=SV8/V/Cc9LCTilBQvaPmq2dzTc8Men3Oz1X2a6QIO+RCbGkI77hZBPTabIGCt7d84/
         RQHJdZwcnVD30Jpfs0AiRzlfQHRTUwJer+Javvx0CiVYU8qGOsoPvSxEd1jntOrz4NuD
         EyS1lBArd1DOVkOWuXAq/kNLPJ8ZBbsdkr+1mS43O7CZwUoFZcnA1foPbX+zjSpVUmrT
         YVmWtAHQ+Uyd5ergDVH4n2SDbDSXtwH0EqrpZrICAgjBjoU6zxp+Zux8DK7dN1UuWh/j
         qEFKztEScWl8CRTs1+avPs2PquNtEURTTUcjVmNyyCgD3zbI70c18SA2+/E+1z/olYOY
         5G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135887; x=1761740687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZd3zxf5Nou1SN92i7qbzIMpgjWXvQnZyGFhzFz0euA=;
        b=EuGhnLspevTP+0a0ZAMZ7V+XM1BNlbu5JCh6yR+RyryROw1QAntcXR7jN73mhoWw6t
         PJA0aMsYahUXe2JRy+r0sfXtIwVxpA/cryxXsmeHnXOxPar8WJ0vbEFU1HoCGTR2mzfd
         Fatuyru6dkYA//w9Ke9N7kFyjg+uspS34AF9gMWozrhxwpvyg/oflSCK+J1e45UCK503
         CtwzU+3O6p84F+bMb4JVyzn5A3NtZAxePWIaeYaAYUL82qQUKFftpclkZK8o5fZa20B5
         RGXyJ07AAzgB3eU269vLmVI09PzfWGcqSO+msm6j8oEKMdEL0IJzUqHkhCjXwJnqLtNy
         a4sA==
X-Gm-Message-State: AOJu0YyZeNEJL1fb/3oHEQ21Uwsfv+l5iF48hW1OR5VgtsK/JLnYY27u
	aBmzljJccj3BECliMIuyvPn78KdUe3KKtI4rQTRFy6aQLL1hhMc19q9j
X-Gm-Gg: ASbGnctNbtX1PyoOYxLv7ndIqtn7Gwv263/ziTAEk+6MkLm9lWArLgMjY7wihiraBc8
	O385DEforuO2lXJT0Qg4CMGR1Z+491EhZynJ7JSmxuwHbHU7h7SQ94TD9qR05FbRrULKaMFN2Th
	GbIOW6/dtw8IDL5fub/O7jfZ/iaAdYb67dNOLafU0sClWapXvd78eEcL+WmamZh61XxWRzGVBCr
	PJougm7VpEb0kzatagpCRgTlGdbNLCBSn5s0iWYIw0pUYWQm8SfHERgdJlByQaMNux5p+5NprY+
	wYuBIJ8by5Ono//v8tIU97f8YmIrIZKVy8xZdIJLWpP+Zf7s1r7AoOIZ5ZqMaKl2G7g4svWxuMp
	g4CvgZ6TKwxrtUYeRlScmNae/1e7D9TaZSp8aeM5Agm6Ts6llLtG+sBmcfdGR+tr8+QJH3YtNt1
	3toB5OdgAuD0LxT7oaLmG7irIQQzI=
X-Google-Smtp-Source: AGHT+IGIDI4b44hPg98lkvaYi2Q3ew6WBmVcps2yj50vjzM/G0j1tZGZIPmAl2eR3ta1X3NVUxFEcQ==
X-Received: by 2002:a05:6122:6593:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-5564eebb778mr5783916e0c.13.1761135887154;
        Wed, 22 Oct 2025 05:24:47 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-556620d8d28sm4381469e0c.17.2025.10.22.05.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 05:24:46 -0700 (PDT)
Message-ID: <08e6cffa-d515-4692-b633-6780fbdbe64d@gmail.com>
Date: Wed, 22 Oct 2025 08:24:44 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hangcheck-timer: use pr_crit and fix coding style
To: Clint George <clintbgeorge@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20251018160010.12215-1-clintbgeorge@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251018160010.12215-1-clintbgeorge@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/25 12:00, Clint George wrote:
> Testing:
> - Verified timer firing and margin detection using "hangtest" module that i created (I will paste the code below for reference) and checked dmesg logs for expected output: "Hangcheck: hangcheck value past margin!".
> - Used Static Analysis tools
> - Ensured module builds and inserts cleanly after changes.
> 
> Let me know if you want me to do more testing on this module.
> 
> [] hangtest.c (testing module i created to test hangcheck-timer module):
> 
> MODULE_LICENSE("GPL");
> MODULE_AUTHOR("Clint George");
> MODULE_DESCRIPTION("Hang test for testing hangcheck-timer");
> 
> static int hang_duration = 20;
> module_param(hang_duration, int, 0644);
> 
> static int __init hangtest_init(void) {
>     unsigned long timeout;
> 
>     printk(KERN_INFO "hangtest: Disabling interrupts for %d seconds...\n", hang_duration);
> 
>     local_irq_disable();
>     preempt_disable();
> 
>     timeout = jiffies + (hang_duration * HZ);
>     while (time_before(jiffies, timeout)) {
>         cpu_relax();
>         barrier();
>     }
> 
>     preempt_enable();
>     local_irq_enable();
> 
>     printk(KERN_INFO "hangtest: Interrupts re-enabled\n");
> //    return 0;
>     return -EINVAL; // Return error so module doesn't stay loaded
> }
> 
> static void __exit hangtest_exit(void) {
>     printk(KERN_INFO "hangtest: Exit\n");
> }
> 
> module_init(hangtest_init);
> module_exit(hangtest_exit);


Well done for describing the testing you did, but try to put it in the
change log. As of now, it is in the commit message, which means that if
your patch is committed, people using git log, would be able to see all
of this, but this is something that is only needed for the maintainers,
not for future code viewers.

Plus, they can always recreate your patch if they need to.

Thanks,
David Hunter

