Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BCB26CE25
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780131; cv=none; b=mrfZeCfiTsJeN4QdTCrvb99kjmLkD2Yrro7tRsln0c6ytcwYD+wrJQSvDHAUb2uWVHzruiD9e7K+KEpgqMAVwgiqfDMi15Ook6Hh4Mhz0VGP5fdrdy0o9aeAHc30VeUDQpjEwgPJknlWN59xoKP817M99Cg+j+BFBrZFERNBv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780131; c=relaxed/simple;
	bh=XlDTU9cabYuuxQxafZIKIPtRVQZSY1fOoKVSyjkTGGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=teJsEoCK0vG9Da0NT+mblFJC9SyNsoBZeWgsTkeGLCy1PllRI4gPOIi2ZMe/nmSSTfwYdvEzrD7OQFuzVdPh3AoC/gbbingPH/ButV5hc6ZkUNrDuj4xfPWY4eWQbtmA8JtlOl5rSjMBzC1TuACxMZ1TEhtMbOrd9Uwv76aamTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkLD1Fza; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkLD1Fza"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f5d497692so859875b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758780129; x=1759384929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw6r/w0TQoLUu4aRi3OyGDu4XdJg1UR/ogba8tN6Kc0=;
        b=XkLD1FzaZSGNKDBaEAQzZFIF/mR+iVn7Bb4XcuIsMfPgQbcfUrIXfP3jjcHGt6V/EU
         LZN7o5A1Pr+jgbRwzytGK1jXf1KsJq0KD4q4TdCZFV0qN9Tl5zdGWDA2DowNYud1Q7HT
         IV9QU/mVvjvnCbEDlOpXqFJY9dhsuu5qCTy9BuacxFUtJ8lrBgXfbbka9OP/+oS2zzxy
         KlbxddasuGATGFaFL4JCVNsBSZefsiXMLcJTVDARTHMpBcfKsPD8KfgwvRnVNGnHVD86
         8MJ3i3isSDNpHxDYNpITBDWq3bTLLL97uFQJ5bXm0BSJO338KPQxOQ27NQCU7EO/4mgH
         BfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780129; x=1759384929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw6r/w0TQoLUu4aRi3OyGDu4XdJg1UR/ogba8tN6Kc0=;
        b=Jfm9ns2O8l8Wa6bYL/V8P4UY8BcCqD97+VvoVjlz9SHz2/i3P93O4QR45DvvkOLAxn
         OGwc5+61tL6Ph/veByKYRGg1e4zgua2htsEpcdSrn7/GDuAkuConAwcFPRbWFTfX9Zk1
         PI2aOg8WrTZg85Qo44vPZA6HrQwifhBdpjJHETWj3u3wMUnmk7tiA9z3z8KQAeO9iC6i
         o/dEnX3Bw56lCP++mJWbWJoicafCFUABLafdUqtj8PFWQ+t49wx7ZwWROWBDNK5lHqCm
         jAjU6AWjZoJ+Kt2095RGFOmcpHBcTKKR1tK+vqhRG8sYqYb9otsMrwaUlvE6xyZFzt5Y
         lbHA==
X-Forwarded-Encrypted: i=1; AJvYcCWeziWRKeuoTTjU4pMk4PizEm6eekMoJOhYToZ+J22KuCu0yeNHaUMpvIRgbtpKhYHAJJGPqTVb3F3bpyTbViBmWIQEWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgU+E+O/rH85LrAYh9+NSmOWua5jZCMawSaXSrmwpmcBGYb9CJ
	rZQYcWSh545kOraq+IIDLuLh3opRI+0EgWmEsD2REqhEM0xtqC+PBTmuf/y7sRYD110=
X-Gm-Gg: ASbGncsrkhpGODeLPQurxJB2GTTz9l+XoxOkFdwwIuCOLrEB5nr1xF967Z3bI+EcqdW
	ITJIjJsNlf4PgE8IhgCJUbp+bxa7o2DwtyHrqJeQYDS+5A5SlaHCkoZ03tL8BtjIKU1y+oAIiWB
	ukPf9BmPDYtQKCe3ibMvezjQJ+1xGCGRVMAmJKGKfrz/xCrzzCklf0EtXYhMNKG/P4kANfCVssP
	YJnUx7F+9/Lw8VquMism0wmqlSnJF6vX1JvdO7bZSAU+r6vgMN7jMffhfPbd3lY97OtQwaRGUlA
	dMa92LSgpgYk9m49XMKubUkQfwuPOrz0c5e5jPZ0Yd9ypdzaGGEnv/zkdn3ug+tzI7OzlSZfQuw
	M3hemgyu96b4oX/oTtND1gh1RTD4M5J4Vg5D0AS4=
X-Google-Smtp-Source: AGHT+IGxtpO8fYqBJ4Up101RNQSuSSRj8mAjj4mT1f+xp6lmruNG+NZqgd7e02/Tdm7NWnRO27FsQg==
X-Received: by 2002:a05:6a20:7349:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-2e7d83ba73amr3173114637.42.1758780129245;
        Wed, 24 Sep 2025 23:02:09 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238b19dsm916334b3a.10.2025.09.24.23.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:02:08 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	david.hunter.linux@gmail.com,
	edumazet@google.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	petkan@nucleusys.com,
	skhan@linuxfoundation.org,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com,
	viswanathiyyappan@gmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Thu, 25 Sep 2025 11:29:46 +0530
Message-ID: <20250925055946.189027-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923163727.5e97abdb@kernel.org>
References: <20250923163727.5e97abdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub,

I found the topic very interesting. So I looked into the existing drivers and almost all of them seem to be using `usb_submit_urb`s except `lan78xx` and `smsc75xx`, which have a work item to do the configuration. But I see no synchronization between their work and the data that is used to do the configuration (which can involve multiple requests to the device). Is there any synchronization that I am missing here? 

Thanks,
Deepak Sharma
