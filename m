Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087B7082D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748222086; cv=none; b=His2XmAxjR2skf+mrvmIxXCnlJ7pABF0g9prb/FL31CfQV2/AjGrqORhkixTY4Yh8ySHXtrArtGDqjylW1VJWcLddlmoRCTQv9rz5YUrpNVagJsVv5Fg8kpQ7CIU7JaOyPrdDfIKEYbVO70Zn1uIta1cckyU7bixPvwlLS3ZjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748222086; c=relaxed/simple;
	bh=wK8iotMm7YuIyvWzMfRLm+zMPkx9dIkY5oQlX+KyoAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h35MjuohqNAUzNJ9T/S2PcbHTaN4OokCDdBMzcZw9mo636NO7k8xSw4VmzGI+jQmTAuixWvaufP19PvilnolGsF3NoTW5i22OxTagi7Y1mSk5cuaN83dRbXbyNrmMzLDm5p41M8Qw2XHzDE3te+DsxlFf5d9vqUkVjPLWcZ1kTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=J9QcUn8B; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="J9QcUn8B"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1748222079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aYqvaegJpg9+7eYaLc+ma0QkJLUvpDi0F26E0i+3CRU=;
	b=J9QcUn8BTAzqe3Dpls4aaGGyrnjVBbjaY0Y6Ex7yp92AV2HLbDxUqRVuT9/6jvV88NQRnh
	eO1crmCU8OQltDm7Vk0+RbW9unKWPFfucz4lWjAN7880esFK/w/q84hW5oIXITcJM3+Veh
	bSUPaPXeAin3hnVkApRxm92+jQlyKStwgn3+0CKH33+sZCGYznHauW1LgTam51jS3K9oBB
	iC39JcInZsSKYwCfCoA+AYEOaPKwABjq7F9u4SLpqPRAcK6zY6ja6NjcCyNSk+J02S6210
	N8xnuUBPS0Mmxonkkl2qWtYTyn/BQUiPxcTPZG+u9VjKI+3o3kwi+zKSlAJYIg==
From: George Anthony Vernon <contact@gvernon.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	skhan@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 0/3] Multiple fixes to Amiga joystick documentation
Date: Mon, 26 May 2025 02:14:40 +0100
Message-ID: <20250526011443.136804-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

I've made a few fixes to the Amiga joystick documentation. I discovered
the unintentional spanning cell when experimenting with the Sphinx
manpage builder which emits warnings for those.

I've split these fixes up into logically separated commits which I hope
make them easy to review. Please do let me know if I've done so in poor
taste.

Thanks,

George

George Anthony Vernon (3):
  input: docs: Fix broken table formatting
  input: docs: Correct Amiga 4-jstick adapter pinout
  input: docs: Fix Amiga joysticks grammar & formatting

 Documentation/input/devices/amijoy.rst | 126 +++++++++++++------------
 1 file changed, 68 insertions(+), 58 deletions(-)

-- 
2.49.0

