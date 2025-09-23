Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309F1E502
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758601732; cv=none; b=d0GeBXqqL9JbSPmqyhmdDaKg7a9Jiij4eKdfwm2zORdNoIRTQHa+6zBAcnESqEe/p9qwYduWbOIhWYi6RhVU8JWo9AAzCzyJJ5UbllxnGpXJB6njO2lMnue2hImke1lHgwAvioaUeBngmM/gYs0WOJEJLoujUAPbOUqovKiS4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758601732; c=relaxed/simple;
	bh=HEUcC0Yq7SL3HnYczepYlqBDp9hawlDL2Z9p5vapRWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhkhXAsphlhDDuCY9B1JW922t5BSyhdGfXG/tV+9Zz8xFQ01KuHfP3LNK/o3x/Cx4yNbzxoHRS70tN7ruRQJ0a7JqjjpPBJjM+ohOO1A01YeesV/BAa4fIszpYIAwQrNvLLbQAQzRRVUPVvUeQjdBNM3MnaQpTRmLrglcxlvkn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv0hHSDd; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv0hHSDd"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fbfeb097eso5820551a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 21:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758601729; x=1759206529; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0L8/Mj/CMf/BboL9XZ5gn7LsUamResi9L+Dypyqa7g=;
        b=Tv0hHSDdBNA6w4FKgbGtactdHU5LXy2ALPqw7r0uheVyfLZoV8p8eqOUYsE7iU+WpH
         /SQv44pNr2MFmAWJQHWmpWiYZ4WC4ipqBifrzcpL6H2G6iAD/KQ6kl4Br1ouwRhDimax
         M+idbPs69AcaCxtVsGdCCp9nxPYWIC4IwypZZ+ohBy4QkTQLDSQ3kOullq4Siadhjs+A
         azZ7X6VHC741UKNlZNm5zguStzZurH29i7lvjfB2tkbnOnhtcf5GEo2k+pHmGNtKis9d
         vRIIog1QLB1o/tBAntCEFbMfWMjnM7Zo/vobRzCFd+KhgbQxCB+FhiED7bqUj8OGJcBA
         ffAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758601729; x=1759206529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0L8/Mj/CMf/BboL9XZ5gn7LsUamResi9L+Dypyqa7g=;
        b=bs8dCQ9lbMzVqB8egJg2W7qz2vynE2MWoztbnQPoPdrCy/edEP1gaYNoJLVsL1DnYs
         6IhiTHnxbwBlTqJ/HWadvzWGiUm/xuoEDuypaHiMcbhO1eHWLAlCjdNjioAFeGEa4jX0
         7j3w5GMBg+5cf0wn4GfCaRJNjs5rNJhnAuuotLZ6XSGKxkHxdVJ/mF8SDKZ2QeL5wiRc
         Q6og3z6MICQtAIWh/ISL38UU9SjQyDrs+PH9++W/9LvdnH8vBbJclZiLIQlipJfEvkPI
         AMOw2Gch2xXOuk0Xm3z8XzYfs+028uTLQeffoHZsOXRFnuy1hdpeNiz0iSS05VRBTqw6
         PqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6mZuvc/c8/54eOzy28eGx37rQxiz6SnGaXmNSpzSFDLqEkew/uumczj2ETrD31Cu8JT2kidM4QcgcpvpHkzxjNWN5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLb2/tJbCKm/D6YjcS1as/qOFNPNDVpwiIdf+/uABsOKucQFYq
	zQw/IYglQYBYLt1G/ziDM16Me15IKWdJ8K04k3bT7BzJsJB4hsfXfPp7a9GOr2TZmJALk4SBBFd
	cXulGtoHRTHUf+9X26jsQy0zmrIrDs8r1/rDQ
X-Gm-Gg: ASbGnctSR6H0JYOBbLla7bLmtpMrnt0uJHVAEzMqML4sBf7PlCCH5BadgWclWAZuaAV
	kcVLycNOOiCMSE836K/ELXkjEdljHWMZG8A1rmRacOmetDTlINW5TYWOgFhfUetp2fJ1FBTRpSR
	lCxSC+KpYZSJSmEVtTD42vddw2p0tD0FZGtu0x+Ll4J0datb0YtiLOL97mosd2s7BT/6kmNed2z
	HvI++ehuDA7csp0ATqyiPJx/kO5TdWuvm/I6s+Fs7ISAdVSNZwfag==
X-Google-Smtp-Source: AGHT+IGI8VvJxjrSqdRzk45M8/kjiV8JUO8fNyOSSFYDwY0MLzTPEqc24EHBbra4TdMiT9VAbUvHKiQhHatek4cxEcY=
X-Received: by 2002:a05:6402:90a:b0:632:9d0f:dc6a with SMTP id
 4fb4d7f45d1cf-634677e7c45mr842619a12.17.1758601729233; Mon, 22 Sep 2025
 21:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922170357.148588-1-viswanathiyyappan@gmail.com> <aNHBUJxAs-vomIF3@casper.infradead.org>
In-Reply-To: <aNHBUJxAs-vomIF3@casper.infradead.org>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 23 Sep 2025 09:58:36 +0530
X-Gm-Features: AS18NWBRX3q1A98kbmNFmK2Q0aBW6YNTfnGsD2smO2bt-RtTaenmbYqnzoT0BHs
Message-ID: <CAPrAcgOsYofEUxOB81zaJb0vo994N4diDzYYTaZ-hGEtke+dyQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/slab: Add size validation in kmalloc_array_* functions
To: Matthew Wilcox <willy@infradead.org>
Cc: vbabka@suse.cz, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, harry.yoo@oracle.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev, 
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 03:06, Matthew Wilcox <willy@infradead.org> wrote:
> Is it really a good idea to support 2^28 vclocks?  Surely there's a
> limit that makes sense to the PTP driver.

I think I will add a new macro for the limit and validate against that

Thanks
Viswanath
