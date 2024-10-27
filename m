Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D517B41F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730061164; cv=none; b=sXAyZrx4+zLNccNq/vWxjYjwoleJaEO+hnv11WICoyM7DyD6q4qGjdKqIK8gkTtIFhnpWkSXFeEOfgbBoquBMTVSRRH5+hvElu5W2rOLdAUBg4J+XBh46oDAUN3g/tZrFA2zoUs7R3+82MHT1ksEAPANnhpbIrzf5sAuqd3CIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730061164; c=relaxed/simple;
	bh=MBLg/OHsvkXmNnHMU5vm8OYpQy434w+URxhW3T+UyhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diInD/5uVO+sFjzVfGO9Up2qnBJj8LCN69cvdxn6KwSPoom9KNlctQqJEpmxHtxKkBC24bAYFcHtWNy4VVFlm4XObD0tM37897RAnIQGqQeFJY+Bzn9DpzqvJpTnYw1SNDqyF23pQKpCI7UCJpr6PK3BU/r9783HKDXsTHzFa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hx4C7CMx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hx4C7CMx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso472158a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730061162; x=1730665962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO6Wn/W7DXpFOgOHg2+qI7JkUohymRKs3+L+zv+wF38=;
        b=hx4C7CMxUyJdNggB5Xlis11AiqXIghH/+OdQ1sFjt5ghe48GFPuqHwE84r/eSQAISn
         BRY5rXCO95epS6rHOjmqOV6ZVgR2LyDbyJGY5aPION2fx7R7r0iEIV1kiGC09UOn4z8g
         reuGMbA5NNb/2NxzEyPh3v0EbhwNK3WCXC/4NpDPTUFq9tFiTz2YzZSoCVUMgyZaTXjC
         r4rSpjeC5FbBi6di4i59jwb25CQBuOz97G7gAZ57PmOmJdHlZmr0bU20KDdwCiWkqMdL
         rpOfpLQoRZAoiNJ5mIeg+zwPsfpkEN5HWkjOWd4kB1iat6cFxaAl8oHfbYzd3Y36Cmb8
         EkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730061162; x=1730665962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO6Wn/W7DXpFOgOHg2+qI7JkUohymRKs3+L+zv+wF38=;
        b=lWVVIrhzEM02j48asABT5p/GEEMxRAMJkwvtrhyHeEycy23WCTVWHHINXR+IEyO73i
         f7AHxwsazSrEtK3gDi4CrqXZ2VYaszj1TVP58n8cX442G8+AjsSxkzHHipQ5TsaFBD+t
         6rQCSCdhojI/liK4NZEX2DwuDW5RrhGxDkdnChqdbrMjSkMi7abKAcKXLUulnuPdCHhn
         3gvdMP1TLf05fp/hLiJ/15QmAUcZTZun9GEnzCRsD0jM10ThX1hjw9PwoTqwnm4lCikF
         pCKm6oyrDWMqYVJXY8q2MmYfe5x8iC3k8IPuiWFBMo8mPekuN/uW/1aUNk17amDeJyj1
         zUfg==
X-Forwarded-Encrypted: i=1; AJvYcCVS9xOHYTzwFfs5ety/bfYQguUnjpJA1Sh1k4mPQ/fS9+svQYokZUfwFkRxw3lORx8QfQdXbcdZvFa3e8EHFYooJCx3Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWMXZgQstW/sOk7qpLHWvs+qwcHC/1Hv6hemjKFi4ZBmn7x/3N
	cFfwWSKH6UI2ERaKs9NAqXiDKSUEiLhRpPV+IPz8gNgkmkdGv/JC
X-Google-Smtp-Source: AGHT+IE41L74XWGTVeMUakZ4CX5VZvMo59R24MX1T61Km8jGghKlk6rov9vGRiRc9gnRwWI7mCR7Cg==
X-Received: by 2002:a17:90a:780b:b0:2e2:b20b:59de with SMTP id 98e67ed59e1d1-2e8f1068be8mr3059152a91.3.1730061162098;
        Sun, 27 Oct 2024 13:32:42 -0700 (PDT)
Received: from motti-test.. ([2409:40f4:300a:9618:92ca:3f55:718b:1cab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48bebasm7721636a91.7.2024.10.27.13.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:32:41 -0700 (PDT)
From: MottiKumar Babu <mottikumarbabu@gmail.com>
To: cem@kernel.org
Cc: djwong@kernel.org,
	chandanbabu@kernel.org,
	dchinner@redhat.com,
	zhangjiachen.jaycee@bytedance.com,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	anupnewsmail@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] Follow-up on Submitted Patch: Fix out-of-bounds access in xfs_bmapi_allocate
Date: Mon, 28 Oct 2024 02:02:28 +0530
Message-ID: <20241027203231.20251-1-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027193541.14212-1-mottikumarbabu@gmail.com>
References: <20241027193541.14212-1-mottikumarbabu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

I hope this message finds you well. I wanted to follow up on my previously submitted patch titled "[PATCH] Fix out-of-bounds access in xfs_bmapi_allocate by validating whichfork."

As a reminder, this patch addresses an issue reported by Coverity Scan (CID 1633175), where the variable `whichfork` can take invalid values, specifically `2`, leading to an out-of-bounds access in `xfs_bmbt_init_cursor`. The added validation check ensures that `whichfork` remains within the valid range of 0 or 1. If it falls outside this range, the function will return `-EINVAL`, enhancing the code's robustness and preventing potential crashes or undefined behavior.

I appreciate any feedback or suggestions you might have.

Best,  
MottiKumar Babu  
mottikumarbabu@gmail.com
