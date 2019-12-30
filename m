Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22485C2D0D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78A620748
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WehwM/dA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78A620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3C8384ADC;
	Mon, 30 Dec 2019 05:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HZ_Zv000Ocr; Mon, 30 Dec 2019 05:05:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3DD48464C;
	Mon, 30 Dec 2019 05:05:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917B7C18DC;
	Mon, 30 Dec 2019 05:05:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 446DDC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 337E0203E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxNsPmlSjumS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id AA96D203E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i6so10856712pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 21:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wG3B56mFaZQZJLeS0bRdj9c2w1Lk+MjODegFMa9Tsw=;
 b=WehwM/dAD+p0ItFyI3MYE39QVUrdAfrXGBwg+edUhS2c5mDGNY0qMOP3KOmS91fiKL
 Y6JWPjC0WHn4L7clDqkvi3IMFyqQbBXNUDyaSJmOlJWYX0P23A+4w/2DufJZ6w94epa5
 DtfyYTtTkpL3WhkDvp/jtpkUzE6T/cJS/EkohwM/wp4s46MKnqF5LqQD8AM6u7qtYPg3
 k8fp2Wz2qGQEYYJCgCbko4zGikkGNpDgPcNEMoyR9WFH550z8ghlno+gxOG0zO6m0vSB
 PcpTOm+EXc9E3WKEWU6Ojy5E833sIB9dqP4HllV6ZEI7XrwXNwMOST7VSqvf1uU8mux0
 j+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wG3B56mFaZQZJLeS0bRdj9c2w1Lk+MjODegFMa9Tsw=;
 b=AbjLjZLdIyfCro0VB9wXfv0ENX0dp3awp0RRXUotIXX0q6BsDIm0kjTL05RUYldDU5
 9qp9wXjil7fv6wdtOTD0uaWK1rsnxtWjdPSTvdW5kDAaGquBPCpYPPwXwbhmgrtbBa+d
 penULnWc/Aft3PNZoevm2OfzOoR4V+Sj9akjsX+kzBp9B5xxFetdHk18YZfoq//GayJM
 QwjhMUrF9e95yOAjdO8bUpGmm93yNmzZ9KkB5cgOvHbLJeyvraFITFX4+oMXU9uTuuth
 zLwukSe5dnH9QsI3LTTIsqifwnKzvOR0qzj5m7F8pES4lWba64x0/kgDG5PACIn26T8T
 Z1gw==
X-Gm-Message-State: APjAAAVAXndrAQD5/Ex3+MzHUy4fdpcrUAyN5q8Bck6ZhQdyR3SLfvMZ
 zmhpG/KMnb2y2P4IRyHDkkk=
X-Google-Smtp-Source: APXvYqyG1Xg3ySuCMy63XhZNRHPkWF3aiijaj0wqhJcHJZymfHo6OBBCcsjUQTsFLdHjIKOQDiOHng==
X-Received: by 2002:a05:6a00:11:: with SMTP id
 h17mr68125791pfk.209.1577682309863; 
 Sun, 29 Dec 2019 21:05:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id r2sm45054727pgv.16.2019.12.29.21.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:05:09 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 02:04:46 -0300
Message-Id: <5523e5ad8da2c9b7af16c26e368f17804e8841cc.1577681894.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681894.git.dwlsalmeida@gmail.com>
References: <cover.1577681894.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 4/5] Documentation: nfs:
	nfs41-server: convert to ReST
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert nfs41-server.txt to ReST. The ASCII tables were converted to
csv-tables and not list-tables because the former is easier to export
from spreadsheets.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst       |   1 +
 .../filesystems/nfs/nfs41-server.rst          | 181 ++++++++++++++++++
 .../filesystems/nfs/nfs41-server.txt          | 173 -----------------
 3 files changed, 182 insertions(+), 173 deletions(-)
 create mode 100644 Documentation/filesystems/nfs/nfs41-server.rst
 delete mode 100644 Documentation/filesystems/nfs/nfs41-server.txt

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index 9d5365cbe2c3..a0a678af921b 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -9,3 +9,4 @@ NFS
    pnfs
    rpc-cache
    rpc-server-gss
+   nfs41-server
diff --git a/Documentation/filesystems/nfs/nfs41-server.rst b/Documentation/filesystems/nfs/nfs41-server.rst
new file mode 100644
index 000000000000..e1e818ec3571
--- /dev/null
+++ b/Documentation/filesystems/nfs/nfs41-server.rst
@@ -0,0 +1,181 @@
+=============================
+NFSv4.1 Server Implementation
+=============================
+
+Server support for minorversion 1 can be controlled using the
+/proc/fs/nfsd/versions control file.  The string output returned
+by reading this file will contain either "+4.1" or "-4.1"
+correspondingly.
+
+Currently, server support for minorversion 1 is enabled by default.
+It can be disabled at run time by writing the string "-4.1" to
+the /proc/fs/nfsd/versions control file.  Note that to write this
+control file, the nfsd service must be taken down.  You can use rpc.nfsd
+for this; see rpc.nfsd(8).
+
+(Warning: older servers will interpret "+4.1" and "-4.1" as "+4" and
+"-4", respectively.  Therefore, code meant to work on both new and old
+kernels must turn 4.1 on or off *before* turning support for version 4
+on or off; rpc.nfsd does this correctly.)
+
+The NFSv4 minorversion 1 (NFSv4.1) implementation in nfsd is based
+on RFC 5661.
+
+From the many new features in NFSv4.1 the current implementation
+focuses on the mandatory-to-implement NFSv4.1 Sessions, providing
+"exactly once" semantics and better control and throttling of the
+resources allocated for each client.
+
+The table below, taken from the NFSv4.1 document, lists
+the operations that are mandatory to implement (REQ), optional
+(OPT), and NFSv4.0 operations that are required not to implement (MNI)
+in minor version 1.  The first column indicates the operations that
+are not supported yet by the linux server implementation.
+
+The OPTIONAL features identified and their abbreviations are as follows:
+
+- **pNFS**	Parallel NFS
+- **FDELG**	File Delegations
+- **DDELG**	Directory Delegations
+
+The following abbreviations indicate the linux server implementation status.
+
+- **I**	Implemented NFSv4.1 operations.
+- **NS**	Not Supported.
+- **NS\***	Unimplemented optional feature.
+
+Operations
+==========
+
+.. csv-table::
+   :header: "Implementation status", "Operation", "REQ, REC, OPT or NMI", "Feature (REQ, REC or OPT)", "Definition"
+   :widths: auto
+   :delim: ;
+
+   ;"ACCESS";"REQ";;"Section 18.1"
+   "I";"BACKCHANNEL_CTL";"REQ";;"Section 18.33"
+   "I";"BIND_CONN_TO_SESSION";"REQ";;"Section 18.34"
+   ;"CLOSE";"REQ";;"Section 18.2"
+   ;"COMMIT";"REQ";;"Section 18.3"
+   ;"CREATE";"REQ";;"Section 18.4"
+   "I";"CREATE_SESSION";"REQ";;"Section 18.36"
+   "NS*";"DELEGPURGE";"OPT";"FDELG (REQ)";"Section 18.5"
+   ;"DELEGRETURN";"OPT";"FDELG,";"Section 18.6"
+   ;;;"DDELG, pNFS";
+   ;;;"(REQ)";
+   "I";"DESTROY_CLIENTID";"REQ";;"Section 18.50"
+   "I";"DESTROY_SESSION";"REQ";;"Section 18.37"
+   "I";"EXCHANGE_ID";"REQ";;"Section 18.35"
+   "I";"FREE_STATEID";"REQ";;"Section 18.38"
+   ;"GETATTR";"REQ";;"Section 18.7"
+   "I";"GETDEVICEINFO";"OPT";"pNFS (REQ)";"Section 18.40"
+   "NS*";"GETDEVICELIST";"OPT";"pNFS (OPT)";"Section 18.41"
+   ;"GETFH";"REQ";;"Section 18.8"
+   "NS*";"GET_DIR_DELEGATION";"OPT";"DDELG (REQ)";"Section 18.39"
+   "I";"LAYOUTCOMMIT";"OPT";"pNFS (REQ)";"Section 18.42"
+   "I";"LAYOUTGET";"OPT";"pNFS (REQ)";"Section 18.43"
+   "I";"LAYOUTRETURN";"OPT";"pNFS (REQ)";"Section 18.44"
+   ;"LINK";"OPT";;"Section 18.9"
+   ;"LOCK";"REQ";;"Section 18.10"
+   ;"LOCKT";"REQ";;"Section 18.11"
+   ;"LOCKU";"REQ";;"Section 18.12"
+   ;"LOOKUP";"REQ";;"Section 18.13"
+   ;"LOOKUPP";"REQ";;"Section 18.14"
+   ;"NVERIFY";"REQ";;"Section 18.15"
+   ;"OPEN";"REQ";;"Section 18.16"
+   "NS*";"OPENATTR";"OPT";;"Section 18.17"
+   ;"OPEN_CONFIRM";"MNI";;"N/A"
+   ;"OPEN_DOWNGRADE";"REQ";;"Section 18.18"
+   ;"PUTFH";"REQ";;"Section 18.19"
+   ;"PUTPUBFH";"REQ";;"Section 18.20"
+   ;"PUTROOTFH";"REQ";;"Section 18.21"
+   ;"READ";"REQ";;"Section 18.22"
+   ;"READDIR";"REQ";;"Section 18.23"
+   ;"READLINK";"OPT";;"Section 18.24"
+   ;"RECLAIM_COMPLETE";"REQ";;"Section 18.51"
+   ;"RELEASE_LOCKOWNER";"MNI";;"N/A"
+   ;"REMOVE";"REQ";;"Section 18.25"
+   ;"RENAME";"REQ";;"Section 18.26"
+   ;"RENEW";"MNI";;"N/A"
+   ;"RESTOREFH";"REQ";;"Section 18.27"
+   ;"SAVEFH";"REQ";;"Section 18.28"
+   ;"SECINFO";"REQ";;"Section 18.29"
+   "I";"SECINFO_NO_NAME";"REC";"pNFS files";"Section 18.45,"
+   ;;;"layout (REQ)";"Section 13.12"
+   "I";"SEQUENCE";"REQ";;"Section 18.46"
+   ;"SETATTR";"REQ";;"Section 18.30"
+   ;"SETCLIENTID";"MNI";;"N/A"
+   ;"SETCLIENTID_CONFIRM";"MNI";;"N/A"
+   "NS";"SET_SSV";"REQ";;"Section 18.47"
+   "I";"TEST_STATEID";"REQ";;"Section 18.48"
+   ;"VERIFY";"REQ";;"Section 18.31"
+   "NS*";"WANT_DELEGATION";"OPT";"FDELG (OPT)";"Section 18.49"
+   ;"WRITE";"REQ";;"Section 18.32"
+
+
+Callback Operations
+===================
+
+.. csv-table::
+   :header: "Implementation status", "Operation", "REQ, REC, OPT or NMI", "Feature (REQ, REC or OPT)", "Definition"
+   :widths: auto
+   :delim: ;
+
+   ;"CB_GETATTR";"OPT";"FDELG (REQ)";"Section 20.1"
+   "I";"CB_LAYOUTRECALL";"OPT";"pNFS (REQ)";"Section 20.3"
+   "NS*";"CB_NOTIFY";"OPT";"DDELG (REQ)";"Section 20.4"
+   "NS*";"CB_NOTIFY_DEVICEID";"OPT";"pNFS (OPT)";"Section 20.12"
+   "NS*";"CB_NOTIFY_LOCK";"OPT";;"Section 20.11"
+   "NS*";"CB_PUSH_DELEG";"OPT";"FDELG (OPT)";"Section 20.5"
+   ;"CB_RECALL";"OPT";"FDELG,";"Section 20.2"
+   ;;;"DDELG, pNFS";
+   ;;;"(REQ)";
+   "NS*";"CB_RECALL_ANY";"OPT";"FDELG,";"Section 20.6"
+   ;;;"DDELG, pNFS";
+   ;;;"(REQ)";
+   "NS";"CB_RECALL_SLOT";"REQ";;"Section 20.8"
+   "NS*";"CB_RECALLABLE_OBJ_AVAIL";"OPT";"DDELG, pNFS";"Section 20.7"
+   ;;;"(REQ)";
+   "I";"CB_SEQUENCE";"OPT";"FDELG,";"Section 20.9"
+   ;;;"DDELG, pNFS";
+   ;;;"(REQ)";
+   "NS*";"CB_WANTS_CANCELLED";"OPT";"FDELG,";"Section 20.10"
+   ;;;"DDELG, pNFS";
+   ;;;"(REQ)";
+
+
+Implementation notes:
+=====================
+
+SSV:
+  The spec claims this is mandatory, but we don't actually know of any
+  implementations, so we're ignoring it for now.  The server returns
+  NFS4ERR_ENCR_ALG_UNSUPP on EXCHANGE_ID, which should be future-proof.
+
+GSS on the backchannel:
+  Again, theoretically required but not widely implemented (in
+  particular, the current Linux client doesn't request it).  We return
+  NFS4ERR_ENCR_ALG_UNSUPP on CREATE_SESSION.
+
+DELEGPURGE:
+  mandatory only for servers that support CLAIM_DELEGATE_PREV and/or
+  CLAIM_DELEG_PREV_FH (which allows clients to keep delegations that
+  persist across client reboots).  Thus we need not implement this for
+  now.
+
+EXCHANGE_ID:
+  implementation ids are ignored
+
+CREATE_SESSION:
+  backchannel attributes are ignored
+
+SEQUENCE:
+  no support for dynamic slot table renegotiation (optional)
+
+Nonstandard compound limitations:
+  No support for a sessions fore channel RPC compound that requires both a
+  ca_maxrequestsize request and a ca_maxresponsesize reply, so we may
+  fail to live up to the promise we made in CREATE_SESSION fore channel
+  negotiation.
+
+See also http://wiki.linux-nfs.org/wiki/index.php/Server_4.0_and_4.1_issues.
diff --git a/Documentation/filesystems/nfs/nfs41-server.txt b/Documentation/filesystems/nfs/nfs41-server.txt
deleted file mode 100644
index 682a59fabe3f..000000000000
--- a/Documentation/filesystems/nfs/nfs41-server.txt
+++ /dev/null
@@ -1,173 +0,0 @@
-NFSv4.1 Server Implementation
-
-Server support for minorversion 1 can be controlled using the
-/proc/fs/nfsd/versions control file.  The string output returned
-by reading this file will contain either "+4.1" or "-4.1"
-correspondingly.
-
-Currently, server support for minorversion 1 is enabled by default.
-It can be disabled at run time by writing the string "-4.1" to
-the /proc/fs/nfsd/versions control file.  Note that to write this
-control file, the nfsd service must be taken down.  You can use rpc.nfsd
-for this; see rpc.nfsd(8).
-
-(Warning: older servers will interpret "+4.1" and "-4.1" as "+4" and
-"-4", respectively.  Therefore, code meant to work on both new and old
-kernels must turn 4.1 on or off *before* turning support for version 4
-on or off; rpc.nfsd does this correctly.)
-
-The NFSv4 minorversion 1 (NFSv4.1) implementation in nfsd is based
-on RFC 5661.
-
-From the many new features in NFSv4.1 the current implementation
-focuses on the mandatory-to-implement NFSv4.1 Sessions, providing
-"exactly once" semantics and better control and throttling of the
-resources allocated for each client.
-
-The table below, taken from the NFSv4.1 document, lists
-the operations that are mandatory to implement (REQ), optional
-(OPT), and NFSv4.0 operations that are required not to implement (MNI)
-in minor version 1.  The first column indicates the operations that
-are not supported yet by the linux server implementation.
-
-The OPTIONAL features identified and their abbreviations are as follows:
-	pNFS	Parallel NFS
-	FDELG	File Delegations
-	DDELG	Directory Delegations
-
-The following abbreviations indicate the linux server implementation status.
-	I	Implemented NFSv4.1 operations.
-	NS	Not Supported.
-	NS*	Unimplemented optional feature.
-
-Operations
-
-   +----------------------+------------+--------------+----------------+
-   | Operation            | REQ, REC,  | Feature      | Definition     |
-   |                      | OPT, or    | (REQ, REC,   |                |
-   |                      | MNI        | or OPT)      |                |
-   +----------------------+------------+--------------+----------------+
-   | ACCESS               | REQ        |              | Section 18.1   |
-I  | BACKCHANNEL_CTL      | REQ        |              | Section 18.33  |
-I  | BIND_CONN_TO_SESSION | REQ        |              | Section 18.34  |
-   | CLOSE                | REQ        |              | Section 18.2   |
-   | COMMIT               | REQ        |              | Section 18.3   |
-   | CREATE               | REQ        |              | Section 18.4   |
-I  | CREATE_SESSION       | REQ        |              | Section 18.36  |
-NS*| DELEGPURGE           | OPT        | FDELG (REQ)  | Section 18.5   |
-   | DELEGRETURN          | OPT        | FDELG,       | Section 18.6   |
-   |                      |            | DDELG, pNFS  |                |
-   |                      |            | (REQ)        |                |
-I  | DESTROY_CLIENTID     | REQ        |              | Section 18.50  |
-I  | DESTROY_SESSION      | REQ        |              | Section 18.37  |
-I  | EXCHANGE_ID          | REQ        |              | Section 18.35  |
-I  | FREE_STATEID         | REQ        |              | Section 18.38  |
-   | GETATTR              | REQ        |              | Section 18.7   |
-I  | GETDEVICEINFO        | OPT        | pNFS (REQ)   | Section 18.40  |
-NS*| GETDEVICELIST        | OPT        | pNFS (OPT)   | Section 18.41  |
-   | GETFH                | REQ        |              | Section 18.8   |
-NS*| GET_DIR_DELEGATION   | OPT        | DDELG (REQ)  | Section 18.39  |
-I  | LAYOUTCOMMIT         | OPT        | pNFS (REQ)   | Section 18.42  |
-I  | LAYOUTGET            | OPT        | pNFS (REQ)   | Section 18.43  |
-I  | LAYOUTRETURN         | OPT        | pNFS (REQ)   | Section 18.44  |
-   | LINK                 | OPT        |              | Section 18.9   |
-   | LOCK                 | REQ        |              | Section 18.10  |
-   | LOCKT                | REQ        |              | Section 18.11  |
-   | LOCKU                | REQ        |              | Section 18.12  |
-   | LOOKUP               | REQ        |              | Section 18.13  |
-   | LOOKUPP              | REQ        |              | Section 18.14  |
-   | NVERIFY              | REQ        |              | Section 18.15  |
-   | OPEN                 | REQ        |              | Section 18.16  |
-NS*| OPENATTR             | OPT        |              | Section 18.17  |
-   | OPEN_CONFIRM         | MNI        |              | N/A            |
-   | OPEN_DOWNGRADE       | REQ        |              | Section 18.18  |
-   | PUTFH                | REQ        |              | Section 18.19  |
-   | PUTPUBFH             | REQ        |              | Section 18.20  |
-   | PUTROOTFH            | REQ        |              | Section 18.21  |
-   | READ                 | REQ        |              | Section 18.22  |
-   | READDIR              | REQ        |              | Section 18.23  |
-   | READLINK             | OPT        |              | Section 18.24  |
-   | RECLAIM_COMPLETE     | REQ        |              | Section 18.51  |
-   | RELEASE_LOCKOWNER    | MNI        |              | N/A            |
-   | REMOVE               | REQ        |              | Section 18.25  |
-   | RENAME               | REQ        |              | Section 18.26  |
-   | RENEW                | MNI        |              | N/A            |
-   | RESTOREFH            | REQ        |              | Section 18.27  |
-   | SAVEFH               | REQ        |              | Section 18.28  |
-   | SECINFO              | REQ        |              | Section 18.29  |
-I  | SECINFO_NO_NAME      | REC        | pNFS files   | Section 18.45, |
-   |                      |            | layout (REQ) | Section 13.12  |
-I  | SEQUENCE             | REQ        |              | Section 18.46  |
-   | SETATTR              | REQ        |              | Section 18.30  |
-   | SETCLIENTID          | MNI        |              | N/A            |
-   | SETCLIENTID_CONFIRM  | MNI        |              | N/A            |
-NS | SET_SSV              | REQ        |              | Section 18.47  |
-I  | TEST_STATEID         | REQ        |              | Section 18.48  |
-   | VERIFY               | REQ        |              | Section 18.31  |
-NS*| WANT_DELEGATION      | OPT        | FDELG (OPT)  | Section 18.49  |
-   | WRITE                | REQ        |              | Section 18.32  |
-
-Callback Operations
-
-   +-------------------------+-----------+-------------+---------------+
-   | Operation               | REQ, REC, | Feature     | Definition    |
-   |                         | OPT, or   | (REQ, REC,  |               |
-   |                         | MNI       | or OPT)     |               |
-   +-------------------------+-----------+-------------+---------------+
-   | CB_GETATTR              | OPT       | FDELG (REQ) | Section 20.1  |
-I  | CB_LAYOUTRECALL         | OPT       | pNFS (REQ)  | Section 20.3  |
-NS*| CB_NOTIFY               | OPT       | DDELG (REQ) | Section 20.4  |
-NS*| CB_NOTIFY_DEVICEID      | OPT       | pNFS (OPT)  | Section 20.12 |
-NS*| CB_NOTIFY_LOCK          | OPT       |             | Section 20.11 |
-NS*| CB_PUSH_DELEG           | OPT       | FDELG (OPT) | Section 20.5  |
-   | CB_RECALL               | OPT       | FDELG,      | Section 20.2  |
-   |                         |           | DDELG, pNFS |               |
-   |                         |           | (REQ)       |               |
-NS*| CB_RECALL_ANY           | OPT       | FDELG,      | Section 20.6  |
-   |                         |           | DDELG, pNFS |               |
-   |                         |           | (REQ)       |               |
-NS | CB_RECALL_SLOT          | REQ       |             | Section 20.8  |
-NS*| CB_RECALLABLE_OBJ_AVAIL | OPT       | DDELG, pNFS | Section 20.7  |
-   |                         |           | (REQ)       |               |
-I  | CB_SEQUENCE             | OPT       | FDELG,      | Section 20.9  |
-   |                         |           | DDELG, pNFS |               |
-   |                         |           | (REQ)       |               |
-NS*| CB_WANTS_CANCELLED      | OPT       | FDELG,      | Section 20.10 |
-   |                         |           | DDELG, pNFS |               |
-   |                         |           | (REQ)       |               |
-   +-------------------------+-----------+-------------+---------------+
-
-Implementation notes:
-
-SSV:
-* The spec claims this is mandatory, but we don't actually know of any
-  implementations, so we're ignoring it for now.  The server returns
-  NFS4ERR_ENCR_ALG_UNSUPP on EXCHANGE_ID, which should be future-proof.
-
-GSS on the backchannel:
-* Again, theoretically required but not widely implemented (in
-  particular, the current Linux client doesn't request it).  We return
-  NFS4ERR_ENCR_ALG_UNSUPP on CREATE_SESSION.
-
-DELEGPURGE:
-* mandatory only for servers that support CLAIM_DELEGATE_PREV and/or
-  CLAIM_DELEG_PREV_FH (which allows clients to keep delegations that
-  persist across client reboots).  Thus we need not implement this for
-  now.
-
-EXCHANGE_ID:
-* implementation ids are ignored
-
-CREATE_SESSION:
-* backchannel attributes are ignored
-
-SEQUENCE:
-* no support for dynamic slot table renegotiation (optional)
-
-Nonstandard compound limitations:
-* No support for a sessions fore channel RPC compound that requires both a
-  ca_maxrequestsize request and a ca_maxresponsesize reply, so we may
-  fail to live up to the promise we made in CREATE_SESSION fore channel
-  negotiation.
-
-See also http://wiki.linux-nfs.org/wiki/index.php/Server_4.0_and_4.1_issues.
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
