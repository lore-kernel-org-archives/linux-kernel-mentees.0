Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105011EB5E1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287953; cv=none; b=Yt+bFqJsxWg+0BKTsYVqApNHdyDXibayaa0X9hgZqUqm3/mXDPcgZmIj+2IiQkA7NUisgCpPBf8/sqKCaC7fbj+RdC2EJh9c277ipyurEhlWnddBanSO5PY8hFFvfHQe96uMTSLpoemuzH7jpGsGboejAN85hGTYTMQlzHwsN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287953; c=relaxed/simple;
	bh=crGSmEZZzBdX5XwVo1TjX4JZzyiOlGt+tkX5ORlR/dM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eBOiVWAH0BzsSl+LLXYrPjmsSqN49Pio/IClDdOT7HEHrTs8E5YdfxZff8xrJDfLxiaSSDrjy7Snna1UDn0kXsSpEyLWR4H6iASxxDSRfZrp9y3fQ7NQRD4/KvHhfHNK1i2AJvWL+lUlPUYBhTVHVKM/uYuUFblSqioQikuE+wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l7xVAMEJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l7xVAMEJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so14947f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753287950; x=1753892750; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7nlf4Cqx5uEEwMr05M8xGLym6bdF69iKrcAxYvQRwA=;
        b=l7xVAMEJdZe3azYiFTofg+uiDmD2bYIEZlex8uMc6U8iD/fvJxFCHGzqTc3nEHb9Dk
         EUN6POMmt1DPaQNcUT0fJxv4pUX1lHuJ4eBi+VN/aiw5uVkDhMO5wfq0/LzNoHDkfDkY
         s9ZRnPC52zkvjbGPdO53Ib5BRCAels29kzpoWZPlIVI+FoZVbKROPHizO1JfX+LoqqEH
         5WIEpTyIAlZhiAiNvlx67oKjvWbfrq4m4xrqx1jv6AVJF43nW/FoLY99QZwSsPIDJ848
         X4iRj0dkJjgLmF1DaZg6M3/OL0iWAXSRuLIJPbBuJqmMzpVnYnHhQUrbIN8FeFe3jpBT
         bTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287950; x=1753892750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7nlf4Cqx5uEEwMr05M8xGLym6bdF69iKrcAxYvQRwA=;
        b=WbgS3PR2JGBTNv/2BcyQ01qJtjDxMPvpzYaJyGJRfHR1B4yrPwjiupebO+pX6PrC6z
         Z6TLSZntbJ2bx6szBHjah3OCdEXa4rRg09hS6xPXrIFBIavpWPZxdBpzoeDpIkF601UK
         lHjF9IbDJHgCJu2EsfDfpIDPtGFAZEaXBRA9wB4AKe2yrAAFA+tlEa2sdNbnb3qpaOS3
         enCC3kbcNRRY/eRxrlk7qPiInE1aAEdlvtk3jGyEuHJLMMRDAhDJWhLmfvRsN7aIO8/S
         RdqwhavxLiP0KnJ755lv6ebZp5wD8d4tNipE+TqG15LTzdc2Gi271gX+Z+u4zqJuazbN
         vHaw==
X-Forwarded-Encrypted: i=1; AJvYcCWZeuaTdx09G/pRycmdG48DnTj9oGHk/slq9Zz31qQ2krxn2QPI+EUx0IbEgv/Bajr2q7DjQaB5nmR1SfHGLusIhm4YMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YznhCu+mWP6E4QNGul7ZKZAKojIH5WARXJF997SFQZU9yJKIh2f
	tDUaEzp8hXguJE2ndulYeWZY1PH4LhkIHL0OOxUaGPUd0DVW3P8RIY8jRc3eeUSXR7R8y6KntPl
	8ZKUyKg==
X-Google-Smtp-Source: AGHT+IF1gZj7uYUs8D8ao+ag5oMJ8erDSIHrlj2XvlP24E0UVjCruiGOe8gDPJKfTVGemA9iyDmfCNj918Y=
X-Received: from wrnt1.prod.google.com ([2002:adf:eb81:0:b0:3b6:1610:fc9f])
 (user=nogikh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c03:b0:3a4:f975:30f7
 with SMTP id ffacd0b85a97d-3b768f12e09mr3084562f8f.56.1753287950449; Wed, 23
 Jul 2025 09:25:50 -0700 (PDT)
Date: Wed, 23 Jul 2025 18:25:47 +0200
In-Reply-To: <20250722100743.38914e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250722100743.38914e9a@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250723162547.1395048-1-nogikh@google.com>
Subject: Re: Re: [syzbot ci] Re: net: Revert tx queue length on partial
 failure in dev_qdisc_change_tx_queue_len()
From: Aleksandr Nogikh <nogikh@google.com>
To: kuba@kernel.org
Cc: dvyukov@google.com, edumazet@google.com, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Tue, 22 Jul 2025 Jakub Kicinski wrote:
> I think this email is missing a References: header ?
> It doesn't get threaded properly.

Yes, that was indeed a bug that has now been fixed, thanks for
reaching out!

-- 
Aleksandr
