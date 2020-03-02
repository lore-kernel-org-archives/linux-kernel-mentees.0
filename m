Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B78C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F32624677
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SljIp1RR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F32624677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EBC186B6F;
	Mon,  2 Mar 2020 18:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRdWw5sVn+tB; Mon,  2 Mar 2020 18:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4C5786E1A;
	Mon,  2 Mar 2020 18:32:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1CD9C1D85;
	Mon,  2 Mar 2020 18:32:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 721D4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 60C1585A84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7-l5EZbaXCU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B72A6858A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:15 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o2so146679pjp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 10:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m7kkow2C6PEJW5ePtZjJYVncQ+PCJkIgww9bNF+Zjxs=;
 b=SljIp1RR7uuy7/L/p7Lans4VKVeMoQS3VHUbhlhBZ6lp82VNCoZBjpY4g6SW6YMTCS
 Shm3gSUKvMxysEt3aOF8zhYWdh9bTJ5ewPT+sr83gUTu55uGqw9h2Nss18n9D4wetP/p
 GTtqKmWgVP3+grVbxw/S6yxjkG9AGRZCuBCgiCBikeoQKua5mU56sS1khUt6zHTScAG1
 bR2VaPoOaJTnzXrUfkBBOR5V4wP2OnTL7ckKsadLh+k5HkjfCTsoh/E0IQvA5hhruofW
 Ov7o4+UJj+GchIn3/SSbajyZvHorK4lPTGKxyuiREF3VZY3M42/dZPcj7JdxtDqeHGqn
 wpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m7kkow2C6PEJW5ePtZjJYVncQ+PCJkIgww9bNF+Zjxs=;
 b=typkJBvVzk7hiTvTEnvdNEBmK3kW5R5tluhlXL7KMNAVj11/PL5zCK/F2iVwphC3uy
 wL6YESe0DZoVdfaoUoPGFVsEw3pEoMQSMpN7SQIV6cw0hIapr9LkU2iHrjFHJmFECC32
 5atjHKwduRwtnZ9oCCfDCYC+IbyAC7cH/GM/AtgIR5ozrMCR00Ln6yKRwNKHbTHQQBaV
 J5F9PP2pnbPHr67O6PSUrVaXtna2Fnmhsmsq6mMNOX1f1fj/DyuVmLAO05tiXiit8vKX
 rhDM9X87VHjUwgQU+Na3d68+lULOXtCFb2LMQLRcXNKnR3MTktMd0uU+8ClRpmQ6RmM+
 6FaA==
X-Gm-Message-State: ANhLgQ18eU302sq/RTWH5GpIkT8KtC6NZY3EFHoXBmMtkZmYRn0GepOS
 Q5mK9lM+Z6BGylbP79xXEtw=
X-Google-Smtp-Source: ADFU+vsO1glLJ+EL8p4lej6uxMUwitUvEuBZqy0uV8D0OgzXKhbN70Ih9zfl1imtU9H/WipDDUThfQ==
X-Received: by 2002:a17:90a:db13:: with SMTP id
 g19mr243360pjv.15.1583173935255; 
 Mon, 02 Mar 2020 10:32:15 -0800 (PST)
Received: from localhost.localdomain ([2405:204:800a:15c3:b0b0:78ba:d728:349e])
 by smtp.gmail.com with ESMTPSA id r145sm22508484pfr.5.2020.03.02.10.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:32:14 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 00:01:04 +0530
Message-Id: <20200302183105.27628-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302183105.27628-1-pragat.pandya@gmail.com>
References: <20200302104501.0f9987bb@lwn.net>
 <20200302183105.27628-1-pragat.pandya@gmail.com>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] Documentation: Add
	io-mapping.rst to driver-api manual
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add io-mapping.rst under Documentation/driver-api and reference it from
Sphinx TOC Tree present in Documentation/driver-api/index.rst

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 Documentation/driver-api/index.rst      |  1 +
 Documentation/driver-api/io-mapping.rst | 97 +++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/driver-api/io-mapping.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 0ebe205efd0c..e9da95004632 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -79,6 +79,7 @@ available subsections can be seen below.
    ipmb
    isa
    isapnp
+   io-mapping
    generic-counter
    lightnvm-pblk
    memory-devices/index
diff --git a/Documentation/driver-api/io-mapping.rst b/Documentation/driver-api/io-mapping.rst
new file mode 100644
index 000000000000..a966239f04e4
--- /dev/null
+++ b/Documentation/driver-api/io-mapping.rst
@@ -0,0 +1,97 @@
+========================
+The io_mapping functions
+========================
+
+API
+===
+
+The io_mapping functions in linux/io-mapping.h provide an abstraction for
+efficiently mapping small regions of an I/O device to the CPU. The initial
+usage is to support the large graphics aperture on 32-bit processors where
+ioremap_wc cannot be used to statically map the entire aperture to the CPU
+as it would consume too much of the kernel address space.
+
+A mapping object is created during driver initialization using::
+
+	struct io_mapping *io_mapping_create_wc(unsigned long base,
+						unsigned long size)
+
+'base' is the bus address of the region to be made
+mappable, while 'size' indicates how large a mapping region to
+enable. Both are in bytes.
+
+This _wc variant provides a mapping which may only be used
+with the io_mapping_map_atomic_wc or io_mapping_map_wc.
+
+With this mapping object, individual pages can be mapped either atomically
+or not, depending on the necessary scheduling environment. Of course, atomic
+maps are more efficient::
+
+	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
+				       unsigned long offset)
+
+'offset' is the offset within the defined mapping region.
+Accessing addresses beyond the region specified in the
+creation function yields undefined results. Using an offset
+which is not page aligned yields an undefined result. The
+return value points to a single page in CPU address space.
+
+This _wc variant returns a write-combining map to the
+page and may only be used with mappings created by
+io_mapping_create_wc
+
+Note that the task may not sleep while holding this page
+mapped.
+
+::
+
+	void io_mapping_unmap_atomic(void *vaddr)
+
+'vaddr' must be the value returned by the last
+io_mapping_map_atomic_wc call. This unmaps the specified
+page and allows the task to sleep once again.
+
+If you need to sleep while holding the lock, you can use the non-atomic
+variant, although they may be significantly slower.
+
+::
+
+	void *io_mapping_map_wc(struct io_mapping *mapping,
+				unsigned long offset)
+
+This works like io_mapping_map_atomic_wc except it allows
+the task to sleep while holding the page mapped.
+
+
+::
+
+	void io_mapping_unmap(void *vaddr)
+
+This works like io_mapping_unmap_atomic, except it is used
+for pages mapped with io_mapping_map_wc.
+
+At driver close time, the io_mapping object must be freed::
+
+	void io_mapping_free(struct io_mapping *mapping)
+
+Current Implementation
+======================
+
+The initial implementation of these functions uses existing mapping
+mechanisms and so provides only an abstraction layer and no new
+functionality.
+
+On 64-bit processors, io_mapping_create_wc calls ioremap_wc for the whole
+range, creating a permanent kernel-visible mapping to the resource. The
+map_atomic and map functions add the requested offset to the base of the
+virtual address returned by ioremap_wc.
+
+On 32-bit processors with HIGHMEM defined, io_mapping_map_atomic_wc uses
+kmap_atomic_pfn to map the specified page in an atomic fashion;
+kmap_atomic_pfn isn't really supposed to be used with device pages, but it
+provides an efficient mapping for this usage.
+
+On 32-bit processors without HIGHMEM defined, io_mapping_map_atomic_wc and
+io_mapping_map_wc both use ioremap_wc, a terribly inefficient function which
+performs an IPI to inform all processors about the new mapping. This results
+in a significant performance penalty.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
