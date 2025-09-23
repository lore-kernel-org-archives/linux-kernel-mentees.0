Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595028466F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758669649; cv=none; b=mxa7+8bxwP/F2FPWsPWuHFgaTxdBfm8dxdJtepED8xVGeDxfrp5EkD9nJFE99jJFj5G2oitVWVrUFgYMCtEXysjhw0wz+OS4rcrNoulO0Baai+dRpPsn2UrULKBtVDIncUnLVW2EHTMhv4sZzF0CHZi3weeU4VsZm7wUBj3oM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758669649; c=relaxed/simple;
	bh=vkZtgaI8+DwA2vFDCXnyuKa4Ewv+3A6r93k8zDXNbj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUrjHj7K1OoK4gjj8Udugi+2X/iXQmU4UuiQgWRMlBLkbh/ha7hqZ1c+Y/X1k1mAnKTRjMblBcbWVfZ/F8Le4GHZHAjkjWC+C5kG2DvXre8VXC8jCjr/XxdR/4Zng8r+oCKmXOeB+VSbbHbcpakg13u89U01+REzFvbdycrMajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJqPYRvr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJqPYRvr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57d93a4b5e5so3190478e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758669646; x=1759274446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kc5MQmgIpaNTBaT8ZNBy5t4B5Vp5p3q0VgcMo06yqw=;
        b=jJqPYRvreiY1aAuTaV0PENE4b3AMJJ6oqNE9rpUSZ/t442/4sINh8Vm4d0uc65f7Xu
         5/jQ6pJfJhPo4Xd8/7mGic9kvR0JN5VXATLue98i5UfJudsG8BMk9Byy7Lmgq6K0hXec
         BGIX99JRxD/qZ97eLdvGt0a9lbDaylcCOGfen5nxLHH+8/fjjS9i6U20jNoyVLfstBb7
         WMjptfLX1/y8GFRfCJF4Z2Q057QjN0Fsr5Dn5zcX2L0rbnGGO61LWNV5ydEnngjepQb3
         ikafN0kFLzwv7UwqSHTF9YwuiGdzloT1aYpfU63AIn8zJ7rwXo3vPifTyWzg1dEPAp4N
         vHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758669646; x=1759274446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kc5MQmgIpaNTBaT8ZNBy5t4B5Vp5p3q0VgcMo06yqw=;
        b=tit2ADquAru4hgGdICMZnYaeoK4ILDtXjj9T230vjUpCg+0VEZRyPwsBEkExa0IWb0
         JBPQupGvGThY3RZiiCna4d2nvkHYGzgJ+ty8pnsA28kq5lzctpEWRVMqdgDYGVJ9GJ1z
         IkkAYX8djkpl+wO1ispQox35Ryz4OJMW3tTsz+VuBoJpbHxIKt3jYYTSXWpzOzoRl671
         C4xK1EYaAHiibvyM+DOtwZFWq7gop2Zkk64DHjolD7c659bLg9D6BgoHO4uZ/6XlvHPi
         ObwaeziIT4fnxCuuzl7vbm25Zy6xWVLuTUD5v67Qa3ESnvIR4RQHhCLMf4ZTu2EMaE7a
         i17Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtZPwBXLxlL7rqpPK2Zeemk+cCRs3ADbowvLtU0EBKQBY3niSdnbEu2I6ADyPSvMR3n3QHbf+HRhAU5p5lhDCwH5/JnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqtPfBVtX9qq8XW3ZdB98RQP48Q/yPkvqdnfrD9saDCnmGqSuR
	HMGkUsgJS8S9t0SetCQ0av4/y2loh8oUda1s+P2IBw3UziB6MmhP7wJP
X-Gm-Gg: ASbGncv6c+QviSeEKen0tU2jde/rOAHkok0VQl7ZzaFHCty2elFJXIa9PoCk7RiLuoj
	46lC+nbGIy8hBes3ynBIbWMwDKe2LwKgJTJSBHRpugom/NGKphQZ1bx95F9eogGUpzm2nJlcSXP
	4/k88NYeSVtxjQD/8FckH8bYZmUGgyS57lzajViOXCAEmp6a4W0A0E4h2s5ZpnK8rCbXwo4jCeT
	GET5JYZlYCKa2IlWKwqBjOb1sfSdIMrG8EtenZ+Zk0UrcNiVrW5lONqVAopzA/Zs+7lth5wsU1z
	tKNeHu8nTptssrYk5w+GiHcg8UbNcwtzahRVlEFEwUVRaAOonUgEhL/2o89BkrRV+SWdQ8Ozi+4
	OPU7qab/2b4HjqmCfb8kdZ4CsNo5rFT8FviE=
X-Google-Smtp-Source: AGHT+IFVMR2s4ilEdfP5c3p3+7X515B1QLyMWkcy/0fTuDiMsgwVqSp4AmW8TfIdg0R7IgmgC3jp6A==
X-Received: by 2002:a05:6512:6314:b0:560:9702:4fe6 with SMTP id 2adb3069b0e04-5807190a878mr1402555e87.24.1758669645455;
        Tue, 23 Sep 2025 16:20:45 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b43ff413asm3101295e87.144.2025.09.23.16.20.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Sep 2025 16:20:45 -0700 (PDT)
Date: Wed, 24 Sep 2025 01:20:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: I Viswanath <viswanathiyyappan@gmail.com>, andrew@lunn.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, david.hunter.linux@gmail.com,
 edumazet@google.com, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, petkan@nucleusys.com,
 skhan@linuxfoundation.org,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250924012039.66a2411c.michal.pecio@gmail.com>
In-Reply-To: <20250923072809.1a58edaf@kernel.org>
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
	<20250920181852.18164-1-viswanathiyyappan@gmail.com>
	<20250922180742.6ef6e2d5@kernel.org>
	<20250923094711.200b96f1.michal.pecio@gmail.com>
	<20250923072809.1a58edaf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Sep 2025 07:28:09 -0700, Jakub Kicinski wrote:
> Excellent, could you check if there is any adverse effect of
> repeatedly writing the RCR register under heavy Tx traffic (without
> stopping/waking the Tx queue)? The driver seems to pause Tx when RCR
> is written, seems like an odd thing to do without a reason, but
> driver authors do the darndest things.

I don't know what's the point of this, because it doesn't prevent the
async "set RCR" control request racing with an async TX URB submitted
before the queue was stopped or after it was restarted.

Such races could be prevented by net core not calling this while TX
is outstanding and not issuing TX until the control request completes,
but it doesn't look like any of that is the case?


I sucessfully reproduced the double submit bug as follows:

ifconfig eth1 10.9.9.9
arp -s 10.9.8.7 87:87:87:87:87:87	# doesn't actually exist
ping -f 10.9.8.7
while :; do ifconfig eth1 allmulti; ifconfig eth1 -allmulti; done

For some reason I had to use two instances of 'ping -f', not sure why.
Then the double submission warning appears in a few seconds and also
some refcount issues, probably on skbs (dev->tx_skb gets mixed up).

With the patch, it all goes away and doesn't show up even after a few
minutes. I also tried with two TCP streams to a real machine and only
observed a 20KB/s decrease in throughput while the ifconfig allmulti
loop is running, probably due to USB bandwidth. So it looks OK.


But one annoying problem is that those control requests are posted
asynchronously and under my test they seem to accumulate faster than
they drain. I get brief or not so brief lockups when USB core cleans
this up on sudden disconnection. And rtl8150_disconnect() should kill
them, but it doesn't.

Not sure how this is supposed to work in a well-behaved net driver? Is
this callback expected to return without sleeping and have an immediate
effect? I can't see this working with USB.

Regards,
Michal
