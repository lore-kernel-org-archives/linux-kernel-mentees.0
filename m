Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A69C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5917420CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0vneKy9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5917420CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C1CE861A7;
	Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruTOYCXMhV-7; Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFB5A86BAD;
	Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE80C1D83;
	Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF98EC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E83F20357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfgnnzOjvmvw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E53A2041C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v25so12278466qto.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 20:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGCxpc6mobQZQa4aV2MHFgtp4vrBYB0dQ381wj2F4VA=;
 b=Y0vneKy9rTRxo16BViVXHfHWhYcxbGNXG4r2nOtX/VsVpfpZYV785kkATPnpxn+gEU
 V5cLxsXMRdVVfs63AqPcr007r4De9qhjtdNowkotAgPy/W5flTDOllpEdKqYSEaBa5zO
 vZPp7rJj8VAlelAjGW5nKUNXfX2f410Jnvvh2tnAedYtJDYOxpK6frvVlOs7CnAi3Sz8
 1/tpBvCqhp1iSp3d5DzHrUV9hVKbMurIq/JlBYSLTobxEFaFiUv26w/UiR/6G5fDajSi
 3CO1/m0mtebCMzdxT0LETZjeuW6eJQnGJrAyAIh+OMNn3iDsL78FOfyhy5jgvD7OhIBr
 hmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGCxpc6mobQZQa4aV2MHFgtp4vrBYB0dQ381wj2F4VA=;
 b=izjuVX0cwM3oitS6tk4pxZ3ph7vBzp7HiGXi8A6V2kIpwOZpvWs0D0YFAt/VFTr1ah
 bkI2JGnmuQ64sV5MF2S0Nf+N5Wc/bSvD9Jy5MkzwGfn0eaAApyuuwFl2meaDzSSPSaz7
 hT+lYadVM7Yi1/MMWtNkXXMdxs6V5XCK2IleZmcZARLrfsSXn5PbOyHkq82cE28RkJgM
 rkDntyxjKoRXl3/uA672U/sSvgggpCYSbybhtSowcbowphA4dEj0KL+ZRuNwFwAJo5Uq
 9JxYsB0cv/yEEJOcVxYYIAzmiyTKlU40cPqU9p3DIVe9lU2FYs/yHtnIS31iB4LrapFq
 Ub/Q==
X-Gm-Message-State: APjAAAX1+Cl6V9pRdSHKNc9Cq3Gz9STy8wMsrb3cA5gpjeRqpJmdVxBe
 ZROeOIgZ0OsUghPFXIv7GO0=
X-Google-Smtp-Source: APXvYqw5DhL2t1w1oqJ93hGrmvyKGYpc3sT3ud48HCQY90pAZavHRFmwqXgHg/YUFY/VlebCObCbug==
X-Received: by 2002:aed:25d1:: with SMTP id y17mr25490682qtc.41.1580273376931; 
 Tue, 28 Jan 2020 20:49:36 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 20:49:36 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Wed, 29 Jan 2020 01:49:16 -0300
Message-Id: <20200129044917.566906-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/5] Documentation: nfs:
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

Convert nfs41-server.txt to ReST. ASCII tables were converted to ReST grid
table format.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst       |   1 +
 .../filesystems/nfs/nfs41-server.rst          | 256 ++++++++++++++++++
 .../filesystems/nfs/nfs41-server.txt          | 173 ------------
 3 files changed, 257 insertions(+), 173 deletions(-)
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
index 000000000000..16b5f02f81c3
--- /dev/null
+++ b/Documentation/filesystems/nfs/nfs41-server.rst
@@ -0,0 +1,256 @@
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
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| Implementation status | Operation            | REQ,REC, OPT or NMI | Feature (REQ, REC or OPT) | Definition     |
++=======================+======================+=====================+===========================+================+
+|                       | ACCESS               | REQ                 |                           | Section 18.1   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | BACKCHANNEL_CTL      | REQ                 |                           | Section 18.33  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | BIND_CONN_TO_SESSION | REQ                 |                           | Section 18.34  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | CLOSE                | REQ                 |                           | Section 18.2   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | COMMIT               | REQ                 |                           | Section 18.3   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | CREATE               | REQ                 |                           | Section 18.4   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | CREATE_SESSION       | REQ                 |                           | Section 18.36  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS*                   | DELEGPURGE           | OPT                 | FDELG (REQ)               | Section 18.5   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | DELEGRETURN          | OPT                 | FDELG,                    | Section 18.6   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       |                      |                     | DDELG, pNFS               |                |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       |                      |                     | (REQ)                     |                |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | DESTROY_CLIENTID     | REQ                 |                           | Section 18.50  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | DESTROY_SESSION      | REQ                 |                           | Section 18.37  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | EXCHANGE_ID          | REQ                 |                           | Section 18.35  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | FREE_STATEID         | REQ                 |                           | Section 18.38  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | GETATTR              | REQ                 |                           | Section 18.7   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | GETDEVICEINFO        | OPT                 | pNFS (REQ)                | Section 18.40  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS*                   | GETDEVICELIST        | OPT                 | pNFS (OPT)                | Section 18.41  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | GETFH                | REQ                 |                           | Section 18.8   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS*                   | GET_DIR_DELEGATION   | OPT                 | DDELG (REQ)               | Section 18.39  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | LAYOUTCOMMIT         | OPT                 | pNFS (REQ)                | Section 18.42  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | LAYOUTGET            | OPT                 | pNFS (REQ)                | Section 18.43  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | LAYOUTRETURN         | OPT                 | pNFS (REQ)                | Section 18.44  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LINK                 | OPT                 |                           | Section 18.9   |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LOCK                 | REQ                 |                           | Section 18.10  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LOCKT                | REQ                 |                           | Section 18.11  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LOCKU                | REQ                 |                           | Section 18.12  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LOOKUP               | REQ                 |                           | Section 18.13  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | LOOKUPP              | REQ                 |                           | Section 18.14  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | NVERIFY              | REQ                 |                           | Section 18.15  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | OPEN                 | REQ                 |                           | Section 18.16  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS*                   | OPENATTR             | OPT                 |                           | Section 18.17  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | OPEN_CONFIRM         | MNI                 |                           | N/A            |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | OPEN_DOWNGRADE       | REQ                 |                           | Section 18.18  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | PUTFH                | REQ                 |                           | Section 18.19  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | PUTPUBFH             | REQ                 |                           | Section 18.20  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | PUTROOTFH            | REQ                 |                           | Section 18.21  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | READ                 | REQ                 |                           | Section 18.22  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | READDIR              | REQ                 |                           | Section 18.23  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | READLINK             | OPT                 |                           | Section 18.24  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | RECLAIM_COMPLETE     | REQ                 |                           | Section 18.51  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | RELEASE_LOCKOWNER    | MNI                 |                           | N/A            |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | REMOVE               | REQ                 |                           | Section 18.25  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | RENAME               | REQ                 |                           | Section 18.26  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | RENEW                | MNI                 |                           | N/A            |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | RESTOREFH            | REQ                 |                           | Section 18.27  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | SAVEFH               | REQ                 |                           | Section 18.28  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | SECINFO              | REQ                 |                           | Section 18.29  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | SECINFO_NO_NAME      | REC                 | pNFS files                | Section 18.45, |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       |                      |                     | layout (REQ)              | Section 13.12  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | SEQUENCE             | REQ                 |                           | Section 18.46  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | SETATTR              | REQ                 |                           | Section 18.30  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | SETCLIENTID          | MNI                 |                           | N/A            |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | SETCLIENTID_CONFIRM  | MNI                 |                           | N/A            |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS                    | SET_SSV              | REQ                 |                           | Section 18.47  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| I                     | TEST_STATEID         | REQ                 |                           | Section 18.48  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | VERIFY               | REQ                 |                           | Section 18.31  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+| NS*                   | WANT_DELEGATION      | OPT                 | FDELG (OPT)               | Section 18.49  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+|                       | WRITE                | REQ                 |                           | Section 18.32  |
++-----------------------+----------------------+---------------------+---------------------------+----------------+
+
+
+Callback Operations
+===================
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| Implementation status | Operation               | REQ,REC, OPT or NMI | Feature (REQ, REC or OPT) | Definition    |
++=======================+=========================+=====================+===========================+===============+
+|                       | CB_GETATTR              | OPT                 | FDELG (REQ)               | Section 20.1  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| I                     | CB_LAYOUTRECALL         | OPT                 | pNFS (REQ)                | Section 20.3  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_NOTIFY               | OPT                 | DDELG (REQ)               | Section 20.4  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_NOTIFY_DEVICEID      | OPT                 | pNFS (OPT)                | Section 20.12 |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_NOTIFY_LOCK          | OPT                 |                           | Section 20.11 |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_PUSH_DELEG           | OPT                 | FDELG (OPT)               | Section 20.5  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       | CB_RECALL               | OPT                 | FDELG,                    | Section 20.2  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | DDELG, pNFS               |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | (REQ)                     |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_RECALL_ANY           | OPT                 | FDELG,                    | Section 20.6  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | DDELG, pNFS               |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | (REQ)                     |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS                    | CB_RECALL_SLOT          | REQ                 |                           | Section 20.8  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_RECALLABLE_OBJ_AVAIL | OPT                 | DDELG, pNFS               | Section 20.7  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | (REQ)                     |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| I                     | CB_SEQUENCE             | OPT                 | FDELG,                    | Section 20.9  |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | DDELG, pNFS               |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | (REQ)                     |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+| NS*                   | CB_WANTS_CANCELLED      | OPT                 | FDELG,                    | Section 20.10 |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | DDELG, pNFS               |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
+|                       |                         |                     | (REQ)                     |               |
++-----------------------+-------------------------+---------------------+---------------------------+---------------+
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
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
