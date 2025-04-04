Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E31991BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755080; cv=none; b=J3GYg8w7VbQGOuiGVCJVA/3vBe11mCfN44xxzO4QIStgImqu8WOiOE3QXf6FCfTjytsiXMsBkMnXtnX8TyygXuzSiD1gCSxFWNwv6jrxL8EoRFBlcigL4zaHazcCYhALWRPNuCvgV/UFP42FyI71o9NxE1YLdujMgIP31NHiaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755080; c=relaxed/simple;
	bh=O+GAE5Vzbp65UqRHmQTuY00tUUYdLuUU21KF3CXm+jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ni6ayeSZpzyoDSP0vSP9j5HC3dpgfAw8BrdwoJkcJ5PBmBvTQlgccqAQejE6Ae9kkShsFQ3oTbT6lKFVO4M2efAzm+QgQLOzuhfPUrRY4wKfTawLJ7xYpmclqoE7Rnrd8uEF5pgqjvzi/CDwDkBoL1mp3zitiTQ05Qa16Ex1eKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llpPszlT; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llpPszlT"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EEFC403F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dksdzqs4WUd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 08:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7293D40B1F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7293D40B1F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=llpPszlT
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7293D40B1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:24:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac29af3382dso275933966b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743755075; x=1744359875; darn=lists.linuxfoundation.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8Q4hgwLYaVKLcAdMEHefEZY3heGKBcISCd2gGVlBqQ=;
        b=llpPszlTBe6uSIWNFd00P6lKxI2Y3ocAVAalQB9gIJvrF3PB77OnIfOKrSL66b4idj
         RmhyNLrxu1W5vnWnZJ9cxjzNucHzlZmTwZVBBrjsp1AUG5qMkJC/KrRlr9jKzwg3N1UE
         euX3M4u1nfpe/n2tDN9ecRy5LvhyDSpyOxo9tYsjHV5ACDjvdRuSS3Se39BQ8bA1KsFe
         S2YKWZjd1uuKflS/S6Da+55N1ihYlKXsjHwXOrOg/tuhaWfZ1mUa+e9HuTd6RVrJruyv
         B8Z+oREQii99rMXrrGn3kqsDwHRkTxk+lL4QnQ2wWqTsiPOUOuH06lGE3b/bgVPNxOzH
         +GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755075; x=1744359875;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8Q4hgwLYaVKLcAdMEHefEZY3heGKBcISCd2gGVlBqQ=;
        b=u2eacSrC8gLo/jEUpCPCinTx1OAG0lfbbggM3v+E80k6SyfBttdcdXCafTwr25SoNR
         gAEHEr5w60uqF1kBJg9xvyylzJdyx1H6eAI/3GJxQK0ItgqDHbjWmTxAOskmkVMe8H+/
         3a98Juj53Fb+7Pyxjev4KY3wdFH1dokl/gIu48kKHvporBi8yz/eh9ezPcBsJMCv/yxv
         CQ3DTanPCgtr5OSW75oTw1YYlPt5+wXONa0K50R0ufn5dxflKpxtrLYPBqZgNvb2vw1E
         UdvidP8je/aGh6shHsuCP92CcilP4sVSJaOyRfwITFMPpu0RHbDNUA7hYCyjGMqlTBqd
         +/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW6TcxpibZzIMS9hTKsJH3y+lW4un2rN52oZsNTxmKf5H+KG2qRm/N69wuXgotdBDfImiNAzj60FAsEVNkdj+ydOSc8Og==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YypSnMlrtXTCyqRugQxHgGuAAfF6eRVb4LbziVJFk92owpq08UG
	4ONTHxw8lTRKVw1n2dHiMqiEV+03zGQ4VTZwZKNQHluGgbhG+83w
X-Gm-Gg: ASbGncvrcBm1zHt50mJP+7UQdhU7VY6hNkKYWBk4noml2aRIsvXgh8WjUPByFC/J8lb
	6cFvRuPKyBqOuvF/Z4wro2LjCKuzZkD4gmYVKEuGIVOKYnJD9nnQE64HhXWMqCRAmDUiVjVjnHU
	lq0Knp5ljX+bbwQBhRqhVzkt6+JCa99yFZKIJALWYXIf8m606H/qi8xJ7swoop120j1cOgFoc/k
	fSoeHGAB4+shqxTi8xD2+pnFyszSVv8EXdr88E5xPkIzJe4TGthit2IGIEoypzSg4yD4jGGBgXz
	eUCC3HeR7SFt9eiRs2DsvA4lu/Ew8B7cuI17fmEKPW2q
X-Google-Smtp-Source: AGHT+IEr8VZKlZ7IIYPgxyNWlJEzXndX2BwR3FYtz6od+rPLp6bFG9RsHZn/yoO5kSnu/NpReCNkfg==
X-Received: by 2002:a17:907:3e1b:b0:ac7:7d43:4535 with SMTP id a640c23a62f3a-ac7d6927509mr133733566b.0.1743755074851;
        Fri, 04 Apr 2025 01:24:34 -0700 (PDT)
Received: from localhost ([95.85.21.12])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c0186250sm209973366b.155.2025.04.04.01.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:24:33 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:24:26 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ACPI: apply ACPI_NONSTRING annotations
Message-ID: <cover.1743754416.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mark ACPI_COPY_NAMESEG() destination char arrays with the
ACPI_NONSTRING attribute.

This series depends on an upstream ACPICA commit[1].

[1] https://github.com/acpica/acpica/commit/de1d500509d37

Ahmed Salem (2):
  ACPI: PRM: apply ACPI_NONSTRING annotation
  ACPI: sysfs: apply ACPI_NONSTRING annotation

 drivers/acpi/prmt.c  | 2 +-
 drivers/acpi/sysfs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


base-commit: b3c623b9a94f7f798715c87e7a75ceeecf15292f
-- 
2.47.2

