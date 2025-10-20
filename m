Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B65208D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958633; cv=none; b=MXZcv+HGJWZUonO8te9JFEMJmibzlWwlermUdHzrwUiGxklb0uNP0zVZhvXcauA0LRvdTwgHCMkNmH9YjpZPut1aV3CPQmY9ATRxTmd7rNcsaIsgTN3Q8ojtkaDmco0fr7xecK5FuLmGYpEK7wViok9HaxlBQCPJKtdg3FLRwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958633; c=relaxed/simple;
	bh=lI8ywgeWjN+SfCPlGDPL8Glm1CbFy+WFTO07L/mQ20k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW5sLo/Ce9EBvoMWBWH9Q7DtrU1FRSMya1QpYi+Thy6oVDreYCRqZQiQ0bOqPSgbg8/A2+yLSYQ8k6fwpFSe8ZfrNhBwft/hVxXaXhd5uUBFbquskB4HhRi+AApY42e5/q9lexMSylSzkwrOIJlk0QbulVAQpVZszPmiNifDhnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4vXnlnX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4vXnlnX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228258442B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 11:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oUT7RzfZZWV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 11:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4984D84428
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4984D84428
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U4vXnlnX
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4984D84428
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 11:10:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47114a40161so46438735e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958629; x=1761563429; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1GwM38mh3nqijwky0hI3l2FSxHPE+1vxrvYPxKuFQQ=;
        b=U4vXnlnXfGqQws9kfNuRArsicWccQMnKs1lHutU7YyQL7tIrMuWn68JpszHzllrLdD
         eELDuG5Qr6mrCRRfB9Yu6oU11t5a8ML/GuR6YEugZX6TL9fgUiQ+ega61mLD8147FYZU
         hz4jDi6WbIchvVao2upmwfvzA5lWmUDZL5YG2ZWerk6wCa9H4P4kRo7l/ap97SHgs4Yv
         F8qsYWm+9QhVDsZ+x9WO8IP+r4dXkKCvKYl3aZOOwPKYLeI3BPr8HOv4LvDSPW7jJB8L
         YrN3saP2/30eQ7Aw5Dv/N8mbkiVc69515wUZudPFCwbfERRo6VlD7H1cxP6VQm3pTVxW
         V+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958629; x=1761563429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1GwM38mh3nqijwky0hI3l2FSxHPE+1vxrvYPxKuFQQ=;
        b=MSAgah1flUjavBlGBcQOdQOI8/oG2afyDYj82fsUEpUE6LkDp46DkkzKJKWH13N9bI
         Yt/+VMgpB/xegEmBZDzyYth+y1a/JN0itpdz3foAZANpBZjwEkbwDAibNKm8FkXR7jFY
         sCnm7vW7w9j8vyvjyrGfHVRN7t01GHZxlIYlosn2e8/f/Q2mMws4fuJ5/Sgl3cLZRY6F
         jRIgWn4iSHiAqxAYbbH4ZcWTmn2zfE7G5TnDH8S5w22QBY7ah8eFmtxBWN4Ip2r+plgB
         IK552jdCq6ODONYO5wDaI8x/ES7lU9TGCGzfTKth5Yflj42ibqdSpN/XQpfDy95FIiry
         rvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrVllTtBi9e9A9jv9Wby3gYrS5x6WEm8uYjUXJEiTIdMMYP4QEkUq/IoRvKWE6NVRCluIJ1WOt4W1uHV8d5V/6EX5Ulg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxXUYm+PgkbIA4Tqa5z3hJh6Pypu1HhOpRK6IpkEQcBRkl7oNR+
	3pWwRottXLstuOTu0K2SLlW0/GViYaZcr5bvo/YfWCIR4r3MUyqvA9IZ
X-Gm-Gg: ASbGncuLFWWPCZcNuqeELlvsX0gcv9SKmuUHXWwuNexnroq9iU1qNsVkbtg7twO0LDm
	U7kmlk7sTQilQG9BGYz+83pxMMZjfhZC4gbizCNVEcIzGRV4z+7kzjU2tFuHB4/IFcxnVaWi86t
	IVbY0zaOmI3eUKpG/J71077zxilhqEBZ8MFXYDwou62yhCSPR+vW7pMqZhz6PkzYlFDaQ70w0Jv
	07D/gNlIjY54RujbgWjMcyJaPztgQhpkFf1wQev8bIRbZsncEOjMOUcNHfyoKAjRHLIBo8iy943
	Qb3ORY4bKX+egnofgrQPPQpv0n4PDki9G1aa5L0i0gbbkb3dgzylOitz/OUScrYMq75j5KBkJrB
	9c56SHML4UQMe5UXMujS0c6hUn2amgTmAnQC4QUZyBAez80Aa5AO9bgWUaLBcY6XY9c0YAfF/7L
	mrki+/FA==
X-Google-Smtp-Source: AGHT+IEmMMoOjYfBUT5RqT6xtTVyMvQoeiu0xyX3gRg3r0UUnIXnqBqTe5A7yX+Qs8G91aoDug12qQ==
X-Received: by 2002:a05:600c:8505:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-4711786c71cmr94484055e9.3.1760958628958;
        Mon, 20 Oct 2025 04:10:28 -0700 (PDT)
Received: from fedora ([80.195.98.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c831asm218234765e9.13.2025.10.20.04.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:10:28 -0700 (PDT)
Date: Mon, 20 Oct 2025 04:10:26 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org
Subject: Re: [PATCH] mm/vmalloc: Use kmalloc_array() instead of kmalloc()
Message-ID: <aPYYovFBtHYKpgg4@fedora>
References: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>

On Sat, Oct 18, 2025 at 09:11:48PM +0100, Mehdi Ben Hadj Khelifa wrote:
> The number of NUMA nodes (nr_node_ids) is bounded, so overflow is not a
> practical concern here. However, using kmalloc_array() better reflects the
> intent to allocate an array of unsigned ints, and improves consistency with
> other NUMA-related allocations.
> 
> No functional change intended.
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
