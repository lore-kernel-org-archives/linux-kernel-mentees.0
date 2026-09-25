Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDE165F1A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Sep 2026 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294609; cv=none; b=gEZPyE8u+PL8NoU7r/KmQWRTV9FG/GczfDh0hd6Z1pQIA5X7q+xuunh0a0ICVY/jExT67DeYkxU3ds+upm5Fi4AApVbtOf8UxdZVAOb/3hfa2suLHF6dRyVExuDR5hqhPrVrxCOdAAe7C9NlnVAMEmGFooq9XJHYlc0iN86iBew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294609; c=relaxed/simple;
	bh=HxJRp18ZASLfeI6aBBKe4WUfoXtY7A3JONx48hdHolE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+8CyeOZqknlO7g33QY+Jrew+sth14rDhxfddnybMCgrGcnTb4alzUPqHuSpr77t64ChIGJUlY0kRaPzgOCjjWuprdwlC7UXORv+R+A9Br7Ffx5ObICHHZWMgdk4uF01msV6WR/ZpI0N5ZJMiC46C6qdqfDzj/XeJPIkugI71iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfza2ywX; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfza2ywX"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so307418eec.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294607; x=1790899407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEOSNKxeCJBNAGtkZyV1IkgJGtUbB5DBJZYMoFtteqg=;
        b=pfza2ywXD/YZuyijGnNV+KSopi1Ss0C2Sa+xh54OCOCKvXjFu2KVAofJX0uHUYBT0Q
         SXDcqiUpLqAs5mfAMLkIgQ0I1mlYxUXtLejtCEkZOeuaUlJmmAri5YFra6ZqCNCY30VF
         3gfKhk/RXYff4NZY7hhfaUfXbltKkzWvOc+qD2bohgQEOl/tIqkDk22ovQHOZ41hbC1n
         pFC0PkLPcTqjnUbliVULG783GQpD/q5ZsSq7YUjBNhk5KowS21FmAFFjEXWqFBuv62mC
         IEnCPrSmLV3h0NiBEgqxn1JqSbwbVtJC5QMPYLFHeYuTH07Bb7Vkq017ARt/2d2XkFiA
         xOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294607; x=1790899407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEOSNKxeCJBNAGtkZyV1IkgJGtUbB5DBJZYMoFtteqg=;
        b=pPxQGXiMq1WvrDFsJ6jjgBk2YLYSX56PiyKXv6GXZf1UOxZSbdF0Co3ONAW8H7toTM
         Z/PrEq35tC3W6PE8P6s050KlEHbSldrT8hOVpkSlsWDS+L3gUXjZEpJ8YHYTI6cLPt89
         RZqScnK++eWAST9HXo+RR4S4els/4wjUnjcsJUeQa+s9lT5op1g8wokHCF2y2Ozif79e
         r1QzvlHtdkBcafiN2d/GcrU/Xt7FBj/a6QDJ0sn89RTd/YrSAG2krEqGjh0CmViU8RRl
         3sPuoz59DYzA1FCJUjXE/ldWMeGuYyKzVXQbX3NBatYtBb8i8lbTkm3BHXitFrVvHsN7
         CyLA==
X-Forwarded-Encrypted: i=1; AKwUvBwgRUkhRKQ68Qty1Qn4kd8lHRTv7ZPK+ElFx0OWw/w3QEFOcj+euPPH6PrfaMfGt4T//dZnFbZohZDWxnhLKZaosgiFeA==@lists.linux.dev
X-Gm-Message-State: AFuF++nYMEln3DbkQwHAkut8FmIlzoNb+WZnY+swwc+5OCdeACHBSdav
	0cuouNGgqbzhXAl0ANprOSKnntfYhMwDbSUDGeabjUYYtWpEC8ujRhP1
X-Gm-Gg: AYBFou0Vh8ZZ8Pndf2pKroPfAc4K4g1h5LsztqqLwsRO1D2DIRETtCOzwQptVimJxjh
	ZV5+Odw3TFodFa9C23/k7EwGYtDAUTjT5Ct6Ieh2/LR+DX3CChiKz6PG47Vu0I4tyf4hwCOL097
	GQeXhsQkGFPLCZhWRDARTnNSQPRmAB7mutIRJ7FSMR/exzQTMg60oyDd6/QrGtZKj4zORpssXrh
	/jSU6tD6FJcZdWypBpeBGgpoFYIpswiNBW/5U3oKPTp2WEtPdvmvikxSHnk7hh3hqdkNaPFEyCF
	iRnB3eZBNpmEjJHXmVsKOxEsDdHoLWtbS6eE2hk+bO1D0sgycP7HIedRRHMYZk9jXF1Y1QM6OqM
	prsy5q3b1fgSor+Hzdyad69sUlO4hhA46HnThF0F8lr/ypywjD5I01S6lfOcDntTfPFJChZb+Zg
	iwHUQnoFTZBEkpZNux7JMVoB/1cp5drGHoDgR3yxVs7wwZilDY1h/YSw+DcyQ=
X-Received: by 2002:a05:7300:3715:b0:341:67fc:98df with SMTP id 5a478bee46e88-34167fca954mr845342eec.12.1790294607231;
        Thu, 24 Sep 2026 17:03:27 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e1:11cd::1c6:c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm1944409eec.13.2026.09.24.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:03:26 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] idpf: fix kernel-doc parameter descriptions
Date: Fri, 25 Sep 2026 05:32:44 +0530
Message-ID: <20260925000244.72480-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stale @vport parameter descriptions from

idpf_rx_desc_rel_all() and idpf_vport_queue_grp_rel_all().

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 24b91be25676..6041c3faf7c4 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -487,7 +487,6 @@ static void idpf_rx_desc_rel_bufq(struct idpf_buf_queue *bufq,
 
 /**
  * idpf_rx_desc_rel_all - Free Rx Resources for All Queues
- * @vport: virtual port structure
  * @rsrc: pointer to queue and vector resources
  *
  * Free all rx queues resources
@@ -1394,7 +1393,6 @@ static void idpf_rxq_group_rel(struct idpf_q_vec_rsrc *rsrc)
 
 /**
  * idpf_vport_queue_grp_rel_all - Release all queue groups
- * @vport: vport to release queue groups for
  * @rsrc: pointer to queue and vector resources
  */
 static void idpf_vport_queue_grp_rel_all(struct idpf_q_vec_rsrc *rsrc)
-- 
2.53.0

