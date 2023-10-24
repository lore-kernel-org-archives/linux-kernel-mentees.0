Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9014C25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Oct 2023 10:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CAC6FA8A;
	Tue, 24 Oct 2023 10:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73CAC6FA8A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zyLOFfCs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZp3ZFxbUkkP; Tue, 24 Oct 2023 10:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2AE286FA79;
	Tue, 24 Oct 2023 10:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE286FA79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06DBEC0039;
	Tue, 24 Oct 2023 10:46:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A179AC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 10:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F7A96FA84
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 10:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7A96FA84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30-NbRXrwlKR
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 10:46:40 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06AEC6FA79
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 10:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AEC6FA79
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so33913955e9.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698144398; x=1698749198;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0SpGzt5EPQBKeC5ysJFqlAOyND1HqZsJcmX27vUekos=;
 b=zyLOFfCsiphePK1KmMyqR8WVp6UNn6RiXfzSrkqvQ4UjQrnESTJg50n6Ib254nLTJ8
 YaXyeUHq4lc0Vi+4rG4idQC3k3BZRWWDsRYREKV0FWu2WYVJARJlxuKOl/OcTFEt9lI7
 Q52oGPqSsqTHV703IEpGnVBCPRYkHOuAb4xfanbyvpcBtC+uWfFrtVd05SnZlfsFfeHZ
 cohJDND/Qr00FOO0947NIK3hskFB4Lb72h2nP/X+hHMOI3q+l0qCLL5/OWVgnVjTCXHN
 kLGUEgw6CyK+BirzfBx8zPmWwhdhZBAfxugtukFNGpJH/28by6MD6Vl1NWqcj7qO/gsS
 qmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698144398; x=1698749198;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SpGzt5EPQBKeC5ysJFqlAOyND1HqZsJcmX27vUekos=;
 b=ivXA21EkUcxD+iQWajmkK925oT9Lsn8IUlTItMGmciISuhHbcbUXVFw9yNwVaFj4rw
 OVb+OiAkG3UiBQW6olHIWc3M/7HFeztE9vLvSy1yh81l1NACXtH6aXkdB7ZIC3Mha5JM
 MQBps/RLoP0hPmRnvCn5bt36d451lrptDWjJLLn5bVTOIFLX/6UcyXMWFaatza3lLRNA
 Z/fDcAkWcN/nRbXJsBcakAKhirPhEDGpYNX8B2muF2E7AQxogAPrslvGoKG25B6Yi/Fp
 HqP/uocgpVKwVZUZwrn0aGHub7lhVX+8KD0BHpWETQMzr3sr6HKX2aDgpHITwEXorbqs
 KEqQ==
X-Gm-Message-State: AOJu0YzG3FHHQk8/3XBMTYi6EAOPwbj41issTxwIxSEermWb2ZP1c21/
 IJbPKb5BYBNxiJw+3WrRi0Q29A==
X-Google-Smtp-Source: AGHT+IFal9H1jvC4Q3PK0I2LyrVEO/TLp7BWA+0hdBEGG9xbWftlWywwFOwOKjSW9JtgKcK+ozdIAQ==
X-Received: by 2002:a05:600c:19d1:b0:405:3955:5881 with SMTP id
 u17-20020a05600c19d100b0040539555881mr9060319wmq.36.1698144397131; 
 Tue, 24 Oct 2023 03:46:37 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e23-20020adf9bd7000000b0032d893d8dc8sm9757680wrc.2.2023.10.24.03.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 03:46:36 -0700 (PDT)
Date: Tue, 24 Oct 2023 13:46:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Manas Ghandat <ghandatmanas@gmail.com>,
 dave.kleikamp@oracle.com, shaggy@kernel.org
Subject: Re: [PATCH] jfs: fix slab-out-of-bounds Read in dtSearch
Message-ID: <f5a9e854-5b6c-49bd-9888-525906665966@kadam.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016171130.15952-1-ghandatmanas@gmail.com>
Cc: syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com,
 jfs-discussion@lists.sourceforge.net, Manas Ghandat <ghandatmanas@gmail.com>,
 lkp@intel.com, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Linux-kernel-mentees@lists.linuxfoundation.org
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

Hi Manas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manas-Ghandat/jfs-fix-slab-out-of-bounds-Read-in-dtSearch/20231017-152500
base:   https://github.com/kleikamp/linux-shaggy jfs-next
patch link:    https://lore.kernel.org/r/20231016171130.15952-1-ghandatmanas%40gmail.com
patch subject: [PATCH] jfs: fix slab-out-of-bounds Read in dtSearch
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231024/202310241724.Ed02yUz9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310241724.Ed02yUz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310241724.Ed02yUz9-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_dtree.c:636 dtSearch() warn: impossible condition '(stbl[index] > 128) => ((-128)-127 > 128)'

vim +636 fs/jfs/jfs_dtree.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  567  int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
^1da177e4c3f41 Linus Torvalds   2005-04-16  568  	     struct btstack * btstack, int flag)
^1da177e4c3f41 Linus Torvalds   2005-04-16  569  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  570  	int rc = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  571  	int cmp = 1;		/* init for empty page */
^1da177e4c3f41 Linus Torvalds   2005-04-16  572  	s64 bn;
^1da177e4c3f41 Linus Torvalds   2005-04-16  573  	struct metapage *mp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  574  	dtpage_t *p;
^1da177e4c3f41 Linus Torvalds   2005-04-16  575  	s8 *stbl;
                                                        ^^^^^^^^

^1da177e4c3f41 Linus Torvalds   2005-04-16  576  	int base, index, lim;
^1da177e4c3f41 Linus Torvalds   2005-04-16  577  	struct btframe *btsp;
^1da177e4c3f41 Linus Torvalds   2005-04-16  578  	pxd_t *pxd;
^1da177e4c3f41 Linus Torvalds   2005-04-16  579  	int psize = 288;	/* initial in-line directory */
^1da177e4c3f41 Linus Torvalds   2005-04-16  580  	ino_t inumber;
^1da177e4c3f41 Linus Torvalds   2005-04-16  581  	struct component_name ciKey;
^1da177e4c3f41 Linus Torvalds   2005-04-16  582  	struct super_block *sb = ip->i_sb;
^1da177e4c3f41 Linus Torvalds   2005-04-16  583  
6da2ec56059c3c Kees Cook        2018-06-12  584  	ciKey.name = kmalloc_array(JFS_NAME_MAX + 1, sizeof(wchar_t),
6da2ec56059c3c Kees Cook        2018-06-12  585  				   GFP_NOFS);
09aaa749f637b1 Joe Perches      2007-11-13  586  	if (!ciKey.name) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  587  		rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  588  		goto dtSearch_Exit2;
^1da177e4c3f41 Linus Torvalds   2005-04-16  589  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  590  
^1da177e4c3f41 Linus Torvalds   2005-04-16  591  
^1da177e4c3f41 Linus Torvalds   2005-04-16  592  	/* uppercase search key for c-i directory */
^1da177e4c3f41 Linus Torvalds   2005-04-16  593  	UniStrcpy(ciKey.name, key->name);
^1da177e4c3f41 Linus Torvalds   2005-04-16  594  	ciKey.namlen = key->namlen;
^1da177e4c3f41 Linus Torvalds   2005-04-16  595  
^1da177e4c3f41 Linus Torvalds   2005-04-16  596  	/* only uppercase if case-insensitive support is on */
^1da177e4c3f41 Linus Torvalds   2005-04-16  597  	if ((JFS_SBI(sb)->mntflag & JFS_OS2) == JFS_OS2) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  598  		ciToUpper(&ciKey);
^1da177e4c3f41 Linus Torvalds   2005-04-16  599  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  600  	BT_CLR(btstack);	/* reset stack */
^1da177e4c3f41 Linus Torvalds   2005-04-16  601  
^1da177e4c3f41 Linus Torvalds   2005-04-16  602  	/* init level count for max pages to split */
^1da177e4c3f41 Linus Torvalds   2005-04-16  603  	btstack->nsplit = 1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  604  
^1da177e4c3f41 Linus Torvalds   2005-04-16  605  	/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  606  	 *	search down tree from root:
^1da177e4c3f41 Linus Torvalds   2005-04-16  607  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  608  	 * between two consecutive entries of <Ki, Pi> and <Kj, Pj> of
^1da177e4c3f41 Linus Torvalds   2005-04-16  609  	 * internal page, child page Pi contains entry with k, Ki <= K < Kj.
^1da177e4c3f41 Linus Torvalds   2005-04-16  610  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  611  	 * if entry with search key K is not found
^1da177e4c3f41 Linus Torvalds   2005-04-16  612  	 * internal page search find the entry with largest key Ki
^1da177e4c3f41 Linus Torvalds   2005-04-16  613  	 * less than K which point to the child page to search;
^1da177e4c3f41 Linus Torvalds   2005-04-16  614  	 * leaf page search find the entry with smallest key Kj
^1da177e4c3f41 Linus Torvalds   2005-04-16  615  	 * greater than K so that the returned index is the position of
^1da177e4c3f41 Linus Torvalds   2005-04-16  616  	 * the entry to be shifted right for insertion of new entry.
^1da177e4c3f41 Linus Torvalds   2005-04-16  617  	 * for empty tree, search key is greater than any key of the tree.
^1da177e4c3f41 Linus Torvalds   2005-04-16  618  	 *
^1da177e4c3f41 Linus Torvalds   2005-04-16  619  	 * by convention, root bn = 0.
^1da177e4c3f41 Linus Torvalds   2005-04-16  620  	 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  621  	for (bn = 0;;) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  622  		/* get/pin the page to search */
^1da177e4c3f41 Linus Torvalds   2005-04-16  623  		DT_GETPAGE(ip, bn, mp, psize, p, rc);
^1da177e4c3f41 Linus Torvalds   2005-04-16  624  		if (rc)
^1da177e4c3f41 Linus Torvalds   2005-04-16  625  			goto dtSearch_Exit1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  626  
^1da177e4c3f41 Linus Torvalds   2005-04-16  627  		/* get sorted entry table of the page */
^1da177e4c3f41 Linus Torvalds   2005-04-16  628  		stbl = DT_GETSTBL(p);
^1da177e4c3f41 Linus Torvalds   2005-04-16  629  
^1da177e4c3f41 Linus Torvalds   2005-04-16  630  		/*
^1da177e4c3f41 Linus Torvalds   2005-04-16  631  		 * binary search with search key K on the current page.
^1da177e4c3f41 Linus Torvalds   2005-04-16  632  		 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  633  		for (base = 0, lim = p->header.nextindex; lim; lim >>= 1) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  634  			index = base + (lim >> 1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  635  
7812e358b5edde Manas Ghandat    2023-10-16 @636  			if (stbl[index] > 128 || stbl[index] < 0)

If it's stbl is an s8 so it can't be > 128.

7812e358b5edde Manas Ghandat    2023-10-16  637  				goto out;
7812e358b5edde Manas Ghandat    2023-10-16  638  
^1da177e4c3f41 Linus Torvalds   2005-04-16  639  			if (p->header.flag & BT_LEAF) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  640  				/* uppercase leaf name to compare */
^1da177e4c3f41 Linus Torvalds   2005-04-16  641  				cmp =
^1da177e4c3f41 Linus Torvalds   2005-04-16  642  				    ciCompare(&ciKey, p, stbl[index],
^1da177e4c3f41 Linus Torvalds   2005-04-16  643  					      JFS_SBI(sb)->mntflag);
^1da177e4c3f41 Linus Torvalds   2005-04-16  644  			} else {
^1da177e4c3f41 Linus Torvalds   2005-04-16  645  				/* router key is in uppercase */
^1da177e4c3f41 Linus Torvalds   2005-04-16  646  
^1da177e4c3f41 Linus Torvalds   2005-04-16  647  				cmp = dtCompare(&ciKey, p, stbl[index]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
