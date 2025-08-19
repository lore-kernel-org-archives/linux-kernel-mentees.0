Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CA3314BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604152; cv=none; b=dtRgJFsrzxdn7dvVLvd9Hb5CjTiVoV2SsQyLQM5QJeGp2edAvSrCdaqwPC6eJp5rNprts16i+K+ww1yy8YkGTzCaLrdq1/zRu+b3lVsLZZLXPtIJQL7FU8Dq+4Pgp6Yh5KW4yv29oRSFVseyUMxh8u++crzK1iuSgj5RuJh6XqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604152; c=relaxed/simple;
	bh=IlnWSJV3KzsuMORhmieQKr1kfmdHvuAugMFbiqpc4hM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbraV8MCow1W8svEhyRMibw9uj+I83dAFO38exKBST6AVK9yvX7ADByqZ0+Nt2U5xKgMf5y9gwmizVuKHL2bvDixxpzbgFdB0grHFX0lvnvtPI3zROGkj3Bfh+nVgbFBbkhGqyt5EimUo0lR7LRI0vV2QzGR9a+AngqZEEP8s34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 693ED80B03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.889
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOEImZoj5OGy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 11:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57F96812CE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F96812CE
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 57F96812CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:49:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c5nMr3D6fz6H7rC;
	Tue, 19 Aug 2025 19:26:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 50255140427;
	Tue, 19 Aug 2025 19:29:16 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 19 Aug
 2025 13:29:15 +0200
Date: Tue, 19 Aug 2025 12:29:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Dave Jiang <dave.jiang@intel.com>
CC: Rakuram Eswaran <rakuram.e96@gmail.com>, <linux-doc@vger.kernel.org>,
	<dan.j.williams@intel.com>, <dave@stgolabs.net>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <linux-cxl@vger.kernel.org>,
	<alison.schofield@intel.com>, <gourry@gourry.net>,
	<skhan@linuxfoundation.org>,
	<linux-kernel-mentees@lists.linuxfoundation.org>, <corbet@lwn.net>
Subject: Re: [PATCH v3] Documentation/driver-api: Fix typo error in cxl
Message-ID: <20250819122914.0000062b@huawei.com>
In-Reply-To: <1232c1c6-5bea-4378-b3ee-041b75a87b94@intel.com>
References: <20250818175335.5312-1-rakuram.e96@gmail.com>
	<1232c1c6-5bea-4378-b3ee-041b75a87b94@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon, 18 Aug 2025 15:47:49 -0700
Dave Jiang <dave.jiang@intel.com> wrote:

> On 8/18/25 10:53 AM, Rakuram Eswaran wrote:
> > Fixed the following typo errors
> > 
> > intersparsed ==> interspersed
> > in Documentation/driver-api/cxl/platform/bios-and-efi.rst
> > 
> > ---
> > Changelog:
> > 
> > Changes since v2:
> > - Fixed Signed-off-by line to include fullname
> >   (feedback from Jonathan Corbet)
> > 
> > Changes since v1:
> > - Dropped fix for page-allocator.rst as requested by Gregory
> > 
> > Suggested-by: Gregory Price <gourry@gourry.net> 
> > Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>  
> 
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
FWIW

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

