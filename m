Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA56192B66
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547874; cv=none; b=YNF708Qp2LyvbgdoBtqRVMsvhS4wz34Y+uTXcr0GFtv+jcSFgULmAp0fgrLc0MfzsXYLDZuSk/V9nvGdHNruz9Rgy9GZLPP2BL/adAo72AKTtEaGT+mVmYLPTAAN7mBsE1MRpZR6q6pPHhkCpxqsg+Sl21VMvGweBpEWIGnKiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547874; c=relaxed/simple;
	bh=9U9Oq0mZV2UmPfUWr510i+RGShVlmBrXJe+uht1I9m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3YoezSCFtLfInZXmZXnvrPAi3LKTlIm1qpM79950r3Y50e8BPsLX2D0Cd7Oj+yDYl2sr3oSv7rxxhBf3L4NMu9kTBtD/dy+jFV+bH+0WSaXCrxddEGUIOpx/wL8wqSxeyz37jB9aHEHN/2PBtMgTFPaML2O5HGMxdLDz7Hfy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY/OYPVW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY/OYPVW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244582738b5so37591075ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758547872; x=1759152672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOZ+3sPJjHhme5/KGeK2VfF1vjlB7AEmx0hb+K9u3c4=;
        b=mY/OYPVW0ea3Rgl9jpuITpMHV8EGwage5KcJKCyVVCqnZGbH2Il4Sflp3lwLquFxMt
         gEaNo96ZVm9UCcTdG/sMpueROiGi4vqAB+tWKm9+FnMIHnNklVQsLBg0km8NEpaSvMlA
         uSqIqVhpzsw8HbeTErhBT2gpamaMYrXqTxy9A0V9Z7mu88hSJB4hr3fcyfnv1FQDAXdm
         uvzO9s4MMFUI9MMk96Sg31ZPdTHKzANGzncI+JG49K+5Gvw7keup8gJV0WqjfZ9enQdl
         K6MZEBAbKfF/jOqL9WMyPzczQiIq6UAmapAw5N5VWku/1Rg8Jbfifls+lQWXvKXnOt7/
         xxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547872; x=1759152672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOZ+3sPJjHhme5/KGeK2VfF1vjlB7AEmx0hb+K9u3c4=;
        b=vDrALvRK1wtoRz9+NY5p/BtOpq8qNS1ebYVTixwaFox7B91lGOPLrBOytxRj40yHAS
         Wr7nMRX8JWoO34WoFH+s0rPA0vZtWTeIaWQd+bXr6iNbjTZmiThMkjmQijYNyiECFi1q
         WkYigIuJpjPCTNa6KlrFfx54j87WaLkco9Oqkr3hcH5XbXPVaMdm5ijGYa1dUnQ74QJ4
         nM62pePFgmjbHGc98dshEDAbR4J0VR4fbBKQzH4KKMX4tzUso1DpYMpcBxTP5J64NAkj
         SaXkqbCBq7EOG9hZhXM9eRTPwkCjApIWCz4GjnrICUx4cOR/37uFoJaP2tbIllRBtds3
         qqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnnI7eq4lDiBrV6E+yzgCAQhSxfrIzbVDLBfuUvnrR/dVfIBm0dFR6urnAHi0fmlYw8lOEKO6R9MTxHtGKmcXC9XE7vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3LbVE4t3QeWQY6LWFk/wdMnpYBGQ9LbF8rB9I1F/Uzc8EiVnY
	QapOQV+V9LbN6YeI+2Vdqa7XGwTuUpoOF+Bkzl+JgpM9kGbo4QCkZa/K
X-Gm-Gg: ASbGnctYXGVVVBVw++yqmUKMJW9xmSK+wCKVaMtHhzgiz+I47IBHxAdBv6anVn4PsdI
	DCTtK+d2aUjE7S2WTVH/eZmYQFibd3ek6ObkQSDljDB5rygUe9HdIYjsmIMihZTWbfqWcWbeWrS
	CRbdNK58gX4CUw+lEkCOrYQyOnOFM2q8dWiW4o9i+6I0SXZmrT5sICru0OHA4CJNpjWo0kDh8Uy
	UhsTHt0xxtLcS7gUQMZ+WEeW+tcWW4zYqLPGOlHvzRtF5PMQ5pN0yIU0/R52t00HCVGm4HTVySx
	KitrQynGXkWDT/cWN+Zd+UO5IwIuPgPpPyUieqtmCh5kZGKsVKhN2tQXS7DJmE5Q5fAzxKOCZ8L
	8vdF2s9brt8JCkQZkSLYjvTOirRBtUpVOG3d5Vh9U2A==
X-Google-Smtp-Source: AGHT+IFlTjUjT9pWpL0XES6XJeOQp9klXOqCDduhPdWixXuTgA5G1oF5J1nVDUpvKjADmsMp/r83wg==
X-Received: by 2002:a17:903:11d2:b0:268:cc5:5e4e with SMTP id d9443c01a7336-269ba3f5f96mr161584175ad.1.1758547872057;
        Mon, 22 Sep 2025 06:31:12 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c959sm134572465ad.48.2025.09.22.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:31:11 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: vigneshr@ti.com
Cc: david.hunter.linux@gmail.com,
	krishnagopi487@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Date: Mon, 22 Sep 2025 19:01:06 +0530
Message-ID: <20250922133106.2524-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e79d5220-2824-4cd2-8e61-b1da8d22d2a1@ti.com>
References: <e79d5220-2824-4cd2-8e61-b1da8d22d2a1@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vignesh, Thanks for the review.

Regarding the other occurrence you pointed out in jedec_probe.c, after your
reply, someone (Rahul Kumar) submitted a patch addressing that occurence
in jedec_probe.c. 

link: https://lore.kernel.org/linux-kernel-mentees/20250922071137.900508-1-rk0006818@gmail.com/T/#u

Please let me know if any further changes are needed on my side.
