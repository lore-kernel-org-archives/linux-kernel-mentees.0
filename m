Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3B1E89C
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758479129; cv=none; b=tXvAq4hGQRIBr9vK8S52CBtHHwF3Q6tnctl/5SSOsjNe68DMsLNT2DI81AgRZXJgIy7e+aAACFyWJlG5wuepAmR7Wbij/xukywAsEjMggiqQRBemUN7hUmbforr9TXYbdPW+H8PZlO3SF/5qL9jm3ACE5cTcNDNBUqEhG1RDmWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758479129; c=relaxed/simple;
	bh=Sg2XlYDYQowzGhFzoBkNFLtm8J2pDb29iJgAxgweybI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOxfJTNkuxycV7aHqk2YBv3om8AdP7fhLcsgavhNZA2CiFf9xOOkw3MeK653TZYb7r7I9+bNkQZv1qKe6TZnMUj+W+Wm1bdDLfZXO3ax+fIlmPmzbEpT+p/bF8njmDppf09vuys9sc+LiBq1wniaNL6/Zo6Xob/CWB2tv0SfFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUHPthSh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUHPthSh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f2e960728so607320b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758479126; x=1759083926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tazlFB1vMMn1XBkVq4vMeLHr1D+MHYpw8LrJ666LU9A=;
        b=JUHPthShfmkJapv6Q2He8i1n16nzD6e1DZzxIkYEvDeQr26GOcRNqHokaXVB3khJ/c
         aEDDBShHL6RzEiN90Ir+ZQkfyqLGfJJnK/VpQVY7DJWi2h9gOOfdR7RoTqMbUCF/rkw/
         xHHd7MaJIirndp7VuTV4bCamVqqji7Oj0OO9XdzCAT6Mu1Eqx+rOXy4wxbJk6Tg48PcS
         UeDrOO5XyAKHKGDueqQ+7tyIjrhWk844qw0XjHzhAwP4M748aOIw8FTSwvDDVwluwK2i
         HcvI3T/fnnG8ddPuFkCpZjYAJaD3kNoYaEAE7KwqusUmo6uSh9rx2b3dkDrO5BJglqvw
         +jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758479126; x=1759083926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tazlFB1vMMn1XBkVq4vMeLHr1D+MHYpw8LrJ666LU9A=;
        b=qMgPxxzJmN58FMXu7rKpG4p0kndejqBu0jszGALob5uQqmdQwheYqwngGRp3maf9Bw
         5A0wEIWnyeZItHCcoHXvu7PeBBHpOd1bp4m2kEkcsEJR0xYVDcBHsXJS3fRYg2zzy5mB
         OoaQRatxtCcsqaLRsTFJ4ziCLXwCEEKbbugBfOBqTApIGy0uqnLPacBwotya8G4/1QaU
         ixbg3CEg0o6yjNGH2uYPypp/SMDjv8v8Tlc8pskekcDjj2q6FMTdrj1cIwmFpu7BPvFJ
         11IJphhDIgkcfZ5SN+Wdj1OkxtQFOa+BmNu1EBv/uwHbrNS12vtjyPcfgcmtL1+u4PXI
         QY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYOBYyiCl2YOsNfLnlof6wBxQ3tA4K1jr6hEVULqbf4VQQri2FePjbw3r5xfv6QHQT1Z2UjCQH7NCgBhPoNPt9fcS9UA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhn/pljVcbCTHeE0EqbRcXxLlGO2vkbNnFyzujC+VD7+dN7umK
	AgIIjuf0GSrfahcp8sgPSMayBJoxThEU5BoK8SjEcc41STBQcAA+4vLF
X-Gm-Gg: ASbGncu6z/rOQYgZ7kDLU0KnIHMZP+EADeU2qPNrqu+9HowXy6Zs7Y4pmxDHgRFYp4b
	O6OKZ1hlqoxR+fGplweHbqfEddZyju5pJ54silxgw0s5yWBrzqQ+0IOq73X9zk7JC8SleUepg7j
	qfrytUVkvl9OlmRRWYK89kksOpBS3dvcp3trb3h/+7qhRb5D0BPiDo3T4O6rm1rl/ppzHyx1b9L
	SxIc9mpY1JQwtbQKjrHB54j7/Sepa8uGaLzzUWLzwvBVDHO8Sc6fbxk979Ia0y+z08Xd/XNF4Uf
	JldhsG8HOaeSGwUIt6yadiCV1VP4iZaziXxHm+vOdAqaSo7YtkLjcKUwTq7wJXw8AI0gcibQ9Mb
	O6tdC7S2Ve6VDOP16nKlXIJOLQTjXboahaeKKz+g=
X-Google-Smtp-Source: AGHT+IHLt2ieR3u3ri9zLC9hok3pW1HJzNJYgtBIlleJJpWheh/ss8dcVUIk3PhTLxCm3RaUAckG5A==
X-Received: by 2002:a05:6a00:190a:b0:77f:2eb8:5959 with SMTP id d2e1a72fcca58-77f2eb87ca3mr2849369b3a.29.1758479126425;
        Sun, 21 Sep 2025 11:25:26 -0700 (PDT)
Received: from cortexauth ([2405:201:d038:3034:bd16:ae06:bb55:dd23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f1550f890sm5632367b3a.94.2025.09.21.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 11:25:25 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: krzk@kernel.org,
	vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linville@tuxdriver.com,
	kuba@kernel.org,
	edumazet@google.com,
	juraj@sarinay.com,
	pabeni@redhat.com,
	horms@kernel.org,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Subject: [PATCH RESEND net v3] net: nfc: nci: Add parameter validation for packet data
Date: Sun, 21 Sep 2025 23:53:25 +0530
Message-ID: <20250921182325.12537-1-deepak.sharma.472935@gmail.com>
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
@@ -501,7 +536,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	case NCI_NFC_A_PASSIVE_POLL_MODE:
 	case NCI_NFC_F_PASSIVE_POLL_MODE:
 		ndev->remote_gb_len = min_t(__u8,
-			(ntf->activation_params.poll_nfc_dep.atr_res_len
+					    (ntf->activation_params.poll_nfc_dep.atr_res_len
 						- NFC_ATR_RES_GT_OFFSET),
 			NFC_ATR_RES_GB_MAXSIZE);
 		memcpy(ndev->remote_gb,
@@ -513,7 +548,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
 	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
 		ndev->remote_gb_len = min_t(__u8,
-			(ntf->activation_params.listen_nfc_dep.atr_req_len
+					    (ntf->activation_params.listen_nfc_dep.atr_req_len
 						- NFC_ATR_REQ_GT_OFFSET),
 			NFC_ATR_REQ_GB_MAXSIZE);
 		memcpy(ndev->remote_gb,
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

