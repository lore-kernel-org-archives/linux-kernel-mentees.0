Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DF215F76
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 31 Mar 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743443718; cv=none; b=mEW0GdPNh7OMGzPgnTqFxXHOZb+1gA9P/ZNchCQfHZbBYb5C0EvxxYY5arSE65E7BSouELxwo+PjxN5vktudTVArhBD5G4HrEaEKEAN4HV5l8l7H+Kl/i1qsEPcqmmsxkLPDmjn1A02Bpf6HW7W1EyPQGfiDztHQa5Vzbl/9WF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743443718; c=relaxed/simple;
	bh=ttvXahU6JXAuXxoEGpK31TnHIITuNAysaxcF/tKm/NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8RuMhfqM6oTTa0wSFTc7DMwLYIKkteCS+uhuQDu6fIMjiX7Sr4sZykwHwCStKm9UdF7QD463t3WY0SEklMuYGkDuJX/yPqlyWLy4AOq12s0p52dCB5pHy4bqvQSqka0ulHsT0MuYWSLEHxoOvnzgAD5oiFPu5ubN5x9HedpOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwZaGN++; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwZaGN++"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7982C608E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 31 Mar 2025 17:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLIMgmcFMtr9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Mar 2025 17:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46277608CD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46277608CD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IwZaGN++
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 46277608CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 31 Mar 2025 17:55:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso7847861a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 31 Mar 2025 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743443712; x=1744048512; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KXTV0VWzIghH7eWjopMb8VSJWH0nbYt3yb1dFJgZQTg=;
        b=IwZaGN++GUH9tzdBKLnrEWIQ5CuyUrAKvOqLnEnrBoKegjzQ3+0lxvuhjkmtSx+JWk
         dGKJD90U1TS0rE/1sEwgerzXxBxdNhdWs2RnfrPq7UG+uTV9jeWApyYajUQb8OOaxD9p
         6+bUn17zEM95JhDJLuuNN86gUgm1rmDRYKa9lbcmMH96KQsvdff9DHxQcOmf9OxfaJNr
         U4MmhI0pJdL+dVn8Xs+/HsKmOkSyW6J58F7e9ghL65s8MicSTL63LCveM23dX/4SGdG9
         Xdoj70kjthpxQfxSSp0F6CMnOGcuFv28Jrir2wPJH5GMjreX77lYIy/Wp8WR7UN6KO+J
         POfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743443712; x=1744048512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXTV0VWzIghH7eWjopMb8VSJWH0nbYt3yb1dFJgZQTg=;
        b=YY7lVxtCYFLPwMquWIerwSa51zW9+TwaOI+F9U5V+JuryAmXGYrgxCuQoKjS2ivf9n
         dPnKHvzghmnd/FxDbCwwdRs2l0sZ0Xoy4tzK3Nnr3yYvBYaNgp3VchGaIC/LYw4J9+cG
         HiC1E/bHHR1u4TM2TeYZ64QbJ1p33i5BS7zMwny/qALlwaXkKs2gpgQMmgd+mi9Q213p
         O6OgusRwi8Ou/lKNO7piwxrEr8j4Pp29HOfqjZShFr60qEG3AkESGnpSjoOnkOhTqXiQ
         aMMBygKep41Ks8F14QY7fWg1kxqRbkAH/0KIGei00XqswtIco91lwel/tQ2MUIy1OtY9
         Ufjg==
X-Forwarded-Encrypted: i=1; AJvYcCUYGKq/iGXNrH8ugHS9T9EGeEHDqB0xsgdYQV04r0PLeTAE2I+zOoQg1/O3KYvC87fmSJP+3es2SvO6SaGFOH/VfbFgRg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxw3idLhX6RQKFHZp7o6gmgSKtpv8k/E114GPOoEFPXi2XFiBiA
	TvXYkERJHdxRj9WSHykWixBkobemn94ArobR0SIxaYc+RErZIHnd
X-Gm-Gg: ASbGncvkehQJFCLmHzeTI+hryTOCAZrz1wtHd590FA/o2Cjy2xQq3Tb/Ox8BBoapIo+
	DN8mx4VZhnC4Q88GtK5ND6/EcxrnZ04XPZkefrym5fJcbOiVYXuK9QgqJsWq6Gg7Gm9unNsYAIE
	rVz4QT5Rj4Q8JO+N0pr43kycV45CvU3WL/pds7ajXbxDVUHUUo4C+9OZvvYvEKj6MBGLkr71dhj
	onuxrY/L3a6HYHzs5LX2hyOT1yZHYa/UcXLvVximMOcgU90LXXsNYYctWJaSuI/oGLn9i0+tV8x
	zt/DaPzacYe3MNLOaMF6Ry78BSdvS1c/durdUbLuDa8A5NCvO1BMIk8z
X-Google-Smtp-Source: AGHT+IH/xXI93ke9faWSKBf2mG4FMyJbbgdoQak0Z/9++IGsl4A3a1LlK5tyg/njP7SZPjHykpDxjA==
X-Received: by 2002:a05:6402:42d2:b0:5e6:616f:42e4 with SMTP id 4fb4d7f45d1cf-5edfdd22a1amr10055198a12.27.1743443711992;
        Mon, 31 Mar 2025 10:55:11 -0700 (PDT)
Received: from localhost (13.tor-exit.nothingtohide.nl. [192.42.116.210])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc17dff0bsm5895018a12.70.2025.03.31.10.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 10:55:11 -0700 (PDT)
Date: Mon, 31 Mar 2025 19:55:04 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] ACPI: mark ACPI_COPY_NAMESEG destinations with
 __nonstring attribute
Message-ID: <xxibvztriq62tdzjhubb6ll3tbwghmiynmwxz4jp7clk6x2f7q@ato7owvq5jv6>
References: <cover.1743313252.git.x0rw3ll@gmail.com>
 <a9bd2a1b490b4305c18f8473aab21c97e8902fb8.1743313252.git.x0rw3ll@gmail.com>
 <CAJZ5v0jUO-7t4F09TjpX_Ea-U8i61N=9DWwB3urJ6KQGzFX_-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jUO-7t4F09TjpX_Ea-U8i61N=9DWwB3urJ6KQGzFX_-g@mail.gmail.com>

On 25/03/31 01:49PM, Rafael J. Wysocki wrote:
> On Sun, Mar 30, 2025 at 7:54 AM Ahmed Salem <x0rw3ll@gmail.com> wrote:
> >
> > strncpy(), which ACPI_COPY_NAMESEG currently uses, is deprecated[1].
> >
> > This patch is the first of two, ultimately replacing strncpy() with
> > strtomem(), avoiding future compiler warnings about truncation.
> >
> > [1] https://github.com/KSPP/linux/issues/90
> >
> > Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
> 
> ACPICA material is primarily handled by the upstream ACPICA project on
> GitHub, so please avoid mixing ACPICA code changes with changes to the
> other code in one patch.
> 
> Also, ACPICA changes should first be submitted to upstream ACPICA, as
> indicated on this list for many times, see for instance:
> 
> https://lore.kernel.org/linux-acpi/CAJZ5v0gUDxrAn4W+Rf3ifjrg8Z9ZzTTOZjPFSSN5488mPqzXeA@mail.gmail.com/
> 

Thank you so much for the note! In full transparency, I did see that
comment prior to submitting this patch. However, I wasn't entirely sure
whether I should have done that given the nature of this patch.

This marks my second time contributing patches as part of the LKMP, and
I've just got started learning C fairly recently, so I thought I'd
consolidate the changes into this series so if there's anything wrong
with my approach, it would cut the time discussing it over on upstream
as well as mailing lists. Hindsight being what it is, however, I should
have seen the MR from Kees Cook introducing ACPI_NONSTRING before
proposing changes, so that's definitely lessons learned for current and
future reference.

Point taken nonetheless, and I will be submitting the ACPICA-related PR
upstream, and resend the ACPI-specific one here instead without the RFC
tag. My apologies, and thank you so much once again for your time and
effort!

> > ---
> >  drivers/acpi/acpica/acdebug.h                            | 2 +-
> >  drivers/acpi/prmt.c                                      | 2 +-
> >  drivers/acpi/sysfs.c                                     | 4 ++--
> >  include/acpi/actbl.h                                     | 6 +++---
> >  tools/power/acpi/os_specific/service_layers/oslinuxtbl.c | 2 +-
> >  tools/power/acpi/tools/acpidump/apfiles.c                | 2 +-
> >  6 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/acpi/acpica/acdebug.h b/drivers/acpi/acpica/acdebug.h
> > index 911875c5a5f1..2b56a8178f43 100644
> > --- a/drivers/acpi/acpica/acdebug.h
> > +++ b/drivers/acpi/acpica/acdebug.h
> > @@ -37,7 +37,7 @@ struct acpi_db_argument_info {
> >  struct acpi_db_execute_walk {
> >         u32 count;
> >         u32 max_count;
> > -       char name_seg[ACPI_NAMESEG_SIZE + 1];
> > +       char name_seg[ACPI_NAMESEG_SIZE + 1] __nonstring;
> >  };
> >
> >  #define PARAM_LIST(pl)                  pl
> > diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
> > index e549914a636c..ca70f01c940c 100644
> > --- a/drivers/acpi/prmt.c
> > +++ b/drivers/acpi/prmt.c
> > @@ -40,7 +40,7 @@ struct prm_buffer {
> >  };
> >
> >  struct prm_context_buffer {
> > -       char signature[ACPI_NAMESEG_SIZE];
> > +       char signature[ACPI_NAMESEG_SIZE] __nonstring;
> >         u16 revision;
> >         u16 reserved;
> >         guid_t identifier;
> > diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
> > index a48ebbf768f9..a05d4032d4f1 100644
> > --- a/drivers/acpi/sysfs.c
> > +++ b/drivers/acpi/sysfs.c
> > @@ -307,9 +307,9 @@ static struct kobject *hotplug_kobj;
> >
> >  struct acpi_table_attr {
> >         struct bin_attribute attr;
> > -       char name[ACPI_NAMESEG_SIZE];
> > +       char name[ACPI_NAMESEG_SIZE] __nonstring;
> >         int instance;
> > -       char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE];
> > +       char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE] __nonstring;
> >         struct list_head node;
> >  };
> >
> > diff --git a/include/acpi/actbl.h b/include/acpi/actbl.h
> > index 451f6276da49..8aa60281e7db 100644
> > --- a/include/acpi/actbl.h
> > +++ b/include/acpi/actbl.h
> > @@ -66,12 +66,12 @@
> >   ******************************************************************************/
> >
> >  struct acpi_table_header {
> > -       char signature[ACPI_NAMESEG_SIZE];      /* ASCII table signature */
> > +       char signature[ACPI_NAMESEG_SIZE] __nonstring;  /* ASCII table signature */
> >         u32 length;             /* Length of table in bytes, including this header */
> >         u8 revision;            /* ACPI Specification minor version number */
> >         u8 checksum;            /* To make sum of entire table == 0 */
> > -       char oem_id[ACPI_OEM_ID_SIZE];  /* ASCII OEM identification */
> > -       char oem_table_id[ACPI_OEM_TABLE_ID_SIZE];      /* ASCII OEM table identification */
> > +       char oem_id[ACPI_OEM_ID_SIZE] __nonstring;      /* ASCII OEM identification */
> > +       char oem_table_id[ACPI_OEM_TABLE_ID_SIZE] __nonstring;  /* ASCII OEM table identification */
> >         u32 oem_revision;       /* OEM revision number */
> >         char asl_compiler_id[ACPI_NAMESEG_SIZE];        /* ASCII ASL compiler vendor ID */
> >         u32 asl_compiler_revision;      /* ASL compiler version */
> > diff --git a/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c b/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
> > index 9d70d8c945af..52026b9e389e 100644
> > --- a/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
> > +++ b/tools/power/acpi/os_specific/service_layers/oslinuxtbl.c
> > @@ -19,7 +19,7 @@ ACPI_MODULE_NAME("oslinuxtbl")
> >  typedef struct osl_table_info {
> >         struct osl_table_info *next;
> >         u32 instance;
> > -       char signature[ACPI_NAMESEG_SIZE];
> > +       char signature[ACPI_NAMESEG_SIZE] __nonstring;
> >
> >  } osl_table_info;
> >
> > diff --git a/tools/power/acpi/tools/acpidump/apfiles.c b/tools/power/acpi/tools/acpidump/apfiles.c
> > index 13817f9112c0..5a39b7d9351d 100644
> > --- a/tools/power/acpi/tools/acpidump/apfiles.c
> > +++ b/tools/power/acpi/tools/acpidump/apfiles.c
> > @@ -103,7 +103,7 @@ int ap_open_output_file(char *pathname)
> >
> >  int ap_write_to_binary_file(struct acpi_table_header *table, u32 instance)
> >  {
> > -       char filename[ACPI_NAMESEG_SIZE + 16];
> > +       char filename[ACPI_NAMESEG_SIZE + 16] __nonstring;
> >         char instance_str[16];
> >         ACPI_FILE file;
> >         acpi_size actual;
> > --
> > 2.47.2
> >
> >
