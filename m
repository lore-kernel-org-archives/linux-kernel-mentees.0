Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA325A2BB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807084; cv=none; b=BU3hvL8lKJsQHJ1znb4svvvj8T2FXfVyDXcem4GM/t03mwPb99rERNk6c+gSkO2ZdV4DujJU11HM5Z/saaOo9zKJOM1xKwgpfaEHnRKJvRHMteJOpVjwVjaShmE3v1s5yt4D/PkomHhGhAWJVvueatFuvIaxbCpGdDnf0VXkj/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807084; c=relaxed/simple;
	bh=nFiN2U30gVPLljWDJIzzdHUgnqj++SjZcucgoCoiVLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpKDXwHrnnsJbDFB9xr04j//66DfvTFuXmqYn3/fdhFbCj5tsltlZ0v8znPYI7l39Y+im80nepezA4kWRuZt0tSmK84LMUE8cmBVaWAk58VhPZQhC0d5w4Lieq6IQkvys2yoqyboMhDitytR7TvLmhXXOo9ayIlYnnbBq9CqEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkZP2DPl; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkZP2DPl"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5515eaefceso937301a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758807082; x=1759411882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWYJEU94U2Dg118hCuoxD/7fhyGK/q/mT362d28LjB8=;
        b=SkZP2DPl1rFnQIuHE/UWFr2c3MUNruoZaZ+2rEPB9UC0G779tNMZv8IK8v/gQikSmB
         cfWbN9HHwk0WKG3UiPLGlG1gI2Nzium5+l9+DNChLGlHUBcJgZM65Ta/s/qaTje9nTi5
         j86BVg0MDy9XuyONCi4QRtlWZMvvMliA6H5zqcd/4UQtSQPm2mHzajARnCq5+9LCezAa
         9i+/Hwi0LcRIFXmFVuZpBTlFWA9GS8a784dR1VglJJSvDTf1zKg4mJQJf4mgaAmzgORd
         gGs2BB9e2Q/Rql5wfPQnEGeHmYbjCKWF5xnWIX/YoMRXn64+dgR+Fr793RksV8cIL+Th
         1VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807082; x=1759411882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWYJEU94U2Dg118hCuoxD/7fhyGK/q/mT362d28LjB8=;
        b=rPrH7wPEeavOLK5+RPnxlncOHrdKDdwQf4bi/nJG3H+TgsF6XkwIciKv6Ec5L3LfA6
         hAMb0qD/IDEERybBHpD0BVqzEZnpVjxod1I7D2upocgymU3JYog/f3yAFTHHHJM8V1zd
         HocQLeG0QxA3cgayGaYaqJJ0cScThpkKeIBX/elndrkSutNjWKpXNC2E1bwGK9rkCtYI
         BufZs9idxro0oVuDYI7D8MlkN90Q01U1r69FiViC4PDLGSGJVHUjjWdOhTQ76tMJCNB1
         8SV2lNnc4tNT2HSXgzOHYlrV28uN6OHW1yN/7pL/cP/FEh9doWzXk8//CNdvZbW4DnHF
         T3QA==
X-Forwarded-Encrypted: i=1; AJvYcCUsulwA6YJKZLWLh8OMzIxWH11E+w0SBY3uB3Sts9dynSbruNBenp8ijMpAnVYdUDkCNrOgi2374+F08RvvVRLqE48wDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv2arKC3vl4tKTj+u4/wMImNKZZBOL8IoYDFPZtRKJQ6D9CRZx
	N0srrgvhEcaUVQcMadAL+8gKV8B6p6lUiRnyahHIL5sZpJEd0aICUhSp
X-Gm-Gg: ASbGnctU6MIo7k6VpgefqYMizp7csKY7UV1Arf0+qCmDafmUiIBo49KKmp0d5EKWTEy
	Qvl4fEgYUUL0NU+LY7qWeWrgxJIZtevDGZXS31PKqO7jwl9Uf31dY2fnHBieWfMe2SYW/U67JqO
	QYm8SzaARe3urucbOmARL7nAn7K0xqcRbhV1NjHsMHKQWmE9z+AtiIn4ZryWabHJ3ABVmW6LJfx
	SjEI+/vGC+3TtB3e6n+9t693jIjFJAKzTdXQLEZIREtSVx6aMYlYnBu4JkKLLu6h3BbhasOLjYh
	WUY7BkMVI4e8ZBeXulkMED8BBK9C/inUNNIcvOsvFnpr34I70ury+V8VYF0mY7bnrHYB60PfR4j
	Evrxq6qV8kRtT+Y6IVcuGEismezyuxEIZZLzd0yU=
X-Google-Smtp-Source: AGHT+IEtl1R4GGtXwzv/auMtQA6O0GCzISjAhkZhJ8Lr2wgaROiHi3q/YOQNr2EgxUd44IODkvm8pw==
X-Received: by 2002:a17:903:b83:b0:265:47:a7bd with SMTP id d9443c01a7336-27ed49b802bmr39325835ad.4.1758807081417;
        Thu, 25 Sep 2025 06:31:21 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm25631725ad.8.2025.09.25.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:31:20 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: krzk@kernel.org,
	vadim.fedorenko@linux.dev,
	linville@tuxdriver.com,
	kuba@kernel.org,
	edumazet@google.com,
	juraj@sarinay.com,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Subject: [PATCH net v4] net: nfc: nci: Add parameter validation for packet data
Date: Thu, 25 Sep 2025 18:58:46 +0530
Message-ID: <20250925132846.213425-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported an uninitialized value bug in nci_init_req, which was 
introduced by commit 5aca7966d2a7 ("Merge tag 
'perf-tools-fixes-for-v6.17-2025-09-16' of 
git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools").

This bug arises due to very limited and poor input validation
that was done at nic_valid_size(). This validation only
validates the skb->len (directly reflects size provided at the
userspace interface) with the length provided in the buffer
itself (interpreted as NCI_HEADER). This leads to the processing
of memory content at the address assuming the correct layout
per what opcode requires there. This leads to the accesses to
buffer of `skb_buff->data` which is not assigned anything yet.

Following the same silent drop of packets of invalid sizes at
`nic_valid_size()`, add validation of the data in the respective
handlers and return error values in case of failure. Release
the skb if error values are returned from handlers in 
`nci_nft_packet` and effectively do a silent drop

Possible TODO: because we silently drop the packets, the
call to `nci_request` will be waiting for completion of request
and will face timeouts. These timeouts can get excessively logged
in the dmesg. A proper handling of them may require to export
`nci_request_cancel` (or propagate error handling from the
nft packets handlers).

Reported-by: syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=740e04c2a93467a0f8c8
Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Tested-by: syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
v4:
 - Remove changes unrelated to the fix

v3:
 - Move the checks inside the packet data handlers
 - Improvements to the commit message

v2:
 - Fix the release of skb in case of the early return

v1:
 - Add checks in `nci_ntf_packet` on the skb->len and do early return
   on failure

 net/nfc/nci/ntf.c | 139 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 101 insertions(+), 38 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index a818eff27e6b..c0edf8242e22 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -27,11 +27,16 @@
 
 /* Handle NCI Notification packets */
 
-static void nci_core_reset_ntf_packet(struct nci_dev *ndev,
-				      const struct sk_buff *skb)
+static int nci_core_reset_ntf_packet(struct nci_dev *ndev,
+				     const struct sk_buff *skb)
 {
 	/* Handle NCI 2.x core reset notification */
-	const struct nci_core_reset_ntf *ntf = (void *)skb->data;
+	const struct nci_core_reset_ntf *ntf;
+
+	if (skb->len < sizeof(struct nci_core_reset_ntf))
+		return -EINVAL;
+
+	ntf = (struct nci_core_reset_ntf *)skb->data;
 
 	ndev->nci_ver = ntf->nci_ver;
 	pr_debug("nci_ver 0x%x, config_status 0x%x\n",
@@ -42,15 +47,22 @@ static void nci_core_reset_ntf_packet(struct nci_dev *ndev,
 		__le32_to_cpu(ntf->manufact_specific_info);
 
 	nci_req_complete(ndev, NCI_STATUS_OK);
+
+	return 0;
 }
 
-static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
-					     struct sk_buff *skb)
+static int nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
+					    struct sk_buff *skb)
 {
-	struct nci_core_conn_credit_ntf *ntf = (void *) skb->data;
+	struct nci_core_conn_credit_ntf *ntf;
 	struct nci_conn_info *conn_info;
 	int i;
 
+	if (skb->len < sizeof(struct nci_core_conn_credit_ntf))
+		return -EINVAL;
+
+	ntf = (struct nci_core_conn_credit_ntf *)skb->data;
+
 	pr_debug("num_entries %d\n", ntf->num_entries);
 
 	if (ntf->num_entries > NCI_MAX_NUM_CONN)
@@ -68,7 +80,7 @@ static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 		conn_info = nci_get_conn_info_by_conn_id(ndev,
 							 ntf->conn_entries[i].conn_id);
 		if (!conn_info)
-			return;
+			return 0;
 
 		atomic_add(ntf->conn_entries[i].credits,
 			   &conn_info->credits_cnt);
@@ -77,12 +89,19 @@ static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 	/* trigger the next tx */
 	if (!skb_queue_empty(&ndev->tx_q))
 		queue_work(ndev->tx_wq, &ndev->tx_work);
+
+	return 0;
 }
 
-static void nci_core_generic_error_ntf_packet(struct nci_dev *ndev,
-					      const struct sk_buff *skb)
+static int nci_core_generic_error_ntf_packet(struct nci_dev *ndev,
+					     const struct sk_buff *skb)
 {
-	__u8 status = skb->data[0];
+	__u8 status;
+
+	if (skb->len < 1)
+		return -EINVAL;
+
+	status = skb->data[0];
 
 	pr_debug("status 0x%x\n", status);
 
@@ -91,12 +110,19 @@ static void nci_core_generic_error_ntf_packet(struct nci_dev *ndev,
 		   (the state remains the same) */
 		nci_req_complete(ndev, status);
 	}
+
+	return 0;
 }
 
-static void nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
-						struct sk_buff *skb)
+static int nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
+					       struct sk_buff *skb)
 {
-	struct nci_core_intf_error_ntf *ntf = (void *) skb->data;
+	struct nci_core_intf_error_ntf *ntf;
+
+	if (skb->len < sizeof(struct nci_core_intf_error_ntf))
+		return -EINVAL;
+
+	ntf = (struct nci_core_intf_error_ntf *)skb->data;
 
 	ntf->conn_id = nci_conn_id(&ntf->conn_id);
 
@@ -105,6 +131,8 @@ static void nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 	/* complete the data exchange transaction, if exists */
 	if (test_bit(NCI_DATA_EXCHANGE, &ndev->flags))
 		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
+
+	return 0;
 }
 
 static const __u8 *
@@ -329,13 +357,18 @@ void nci_clear_target_list(struct nci_dev *ndev)
 	ndev->n_targets = 0;
 }
 
-static void nci_rf_discover_ntf_packet(struct nci_dev *ndev,
-				       const struct sk_buff *skb)
+static int nci_rf_discover_ntf_packet(struct nci_dev *ndev,
+				      const struct sk_buff *skb)
 {
 	struct nci_rf_discover_ntf ntf;
-	const __u8 *data = skb->data;
+	const __u8 *data;
 	bool add_target = true;
 
+	if (skb->len < sizeof(struct nci_rf_discover_ntf))
+		return -EINVAL;
+
+	data = skb->data;
+
 	ntf.rf_discovery_id = *data++;
 	ntf.rf_protocol = *data++;
 	ntf.rf_tech_and_mode = *data++;
@@ -390,6 +423,8 @@ static void nci_rf_discover_ntf_packet(struct nci_dev *ndev,
 		nfc_targets_found(ndev->nfc_dev, ndev->targets,
 				  ndev->n_targets);
 	}
+
+	return 0;
 }
 
 static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
@@ -553,14 +588,19 @@ static int nci_store_ats_nfc_iso_dep(struct nci_dev *ndev,
 	return NCI_STATUS_OK;
 }
 
-static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
-					     const struct sk_buff *skb)
+static int nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
+					    const struct sk_buff *skb)
 {
 	struct nci_conn_info *conn_info;
 	struct nci_rf_intf_activated_ntf ntf;
-	const __u8 *data = skb->data;
+	const __u8 *data;
 	int err = NCI_STATUS_OK;
 
+	if (skb->len < sizeof(struct nci_rf_intf_activated_ntf))
+		return -EINVAL;
+
+	data = skb->data;
+
 	ntf.rf_discovery_id = *data++;
 	ntf.rf_interface = *data++;
 	ntf.rf_protocol = *data++;
@@ -667,7 +707,7 @@ static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 	if (err == NCI_STATUS_OK) {
 		conn_info = ndev->rf_conn_info;
 		if (!conn_info)
-			return;
+			return 0;
 
 		conn_info->max_pkt_payload_len = ntf.max_data_pkt_payload_size;
 		conn_info->initial_num_credits = ntf.initial_num_credits;
@@ -721,19 +761,26 @@ static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 				pr_err("error when signaling tm activation\n");
 		}
 	}
+
+	return 0;
 }
 
-static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
-					 const struct sk_buff *skb)
+static int nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
+					const struct sk_buff *skb)
 {
 	const struct nci_conn_info *conn_info;
-	const struct nci_rf_deactivate_ntf *ntf = (void *)skb->data;
+	const struct nci_rf_deactivate_ntf *ntf;
+
+	if (skb->len < sizeof(struct nci_rf_deactivate_ntf))
+		return -EINVAL;
+
+	ntf = (struct nci_rf_deactivate_ntf *)skb->data;
 
 	pr_debug("entry, type 0x%x, reason 0x%x\n", ntf->type, ntf->reason);
 
 	conn_info = ndev->rf_conn_info;
 	if (!conn_info)
-		return;
+		return 0;
 
 	/* drop tx data queue */
 	skb_queue_purge(&ndev->tx_q);
@@ -765,14 +812,20 @@ static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 	}
 
 	nci_req_complete(ndev, NCI_STATUS_OK);
+
+	return 0;
 }
 
-static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
-					  const struct sk_buff *skb)
+static int nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
+					 const struct sk_buff *skb)
 {
 	u8 status = NCI_STATUS_OK;
-	const struct nci_nfcee_discover_ntf *nfcee_ntf =
-				(struct nci_nfcee_discover_ntf *)skb->data;
+	const struct nci_nfcee_discover_ntf *nfcee_ntf;
+
+	if (skb->len < sizeof(struct nci_nfcee_discover_ntf))
+		return -EINVAL;
+
+	nfcee_ntf = (struct nci_nfcee_discover_ntf *)skb->data;
 
 	/* NFCForum NCI 9.2.1 HCI Network Specific Handling
 	 * If the NFCC supports the HCI Network, it SHALL return one,
@@ -783,6 +836,8 @@ static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
 	ndev->cur_params.id = nfcee_ntf->nfcee_id;
 
 	nci_req_complete(ndev, status);
+
+	return 0;
 }
 
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
@@ -809,35 +864,43 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 
 	switch (ntf_opcode) {
 	case NCI_OP_CORE_RESET_NTF:
-		nci_core_reset_ntf_packet(ndev, skb);
+		if (nci_core_reset_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
-		nci_core_conn_credits_ntf_packet(ndev, skb);
+		if (nci_core_conn_credits_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_CORE_GENERIC_ERROR_NTF:
-		nci_core_generic_error_ntf_packet(ndev, skb);
+		if (nci_core_generic_error_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_CORE_INTF_ERROR_NTF:
-		nci_core_conn_intf_error_ntf_packet(ndev, skb);
+		if (nci_core_conn_intf_error_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_RF_DISCOVER_NTF:
-		nci_rf_discover_ntf_packet(ndev, skb);
+		if (nci_rf_discover_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_RF_INTF_ACTIVATED_NTF:
-		nci_rf_intf_activated_ntf_packet(ndev, skb);
+		if (nci_rf_intf_activated_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_RF_DEACTIVATE_NTF:
-		nci_rf_deactivate_ntf_packet(ndev, skb);
+		if (nci_rf_deactivate_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_NFCEE_DISCOVER_NTF:
-		nci_nfcee_discover_ntf_packet(ndev, skb);
+		if (nci_nfcee_discover_ntf_packet(ndev, skb))
+			goto end;
 		break;
 
 	case NCI_OP_RF_NFCEE_ACTION_NTF:
-- 
2.51.0

