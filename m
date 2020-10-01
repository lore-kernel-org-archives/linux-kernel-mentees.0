Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FB0C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 11:08:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E241220B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 11:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMxRzluW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E241220B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67BCF8443D;
	Thu,  1 Oct 2020 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QApDWf4bKgap; Thu,  1 Oct 2020 11:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF6998414F;
	Thu,  1 Oct 2020 11:08:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D22DFC0889;
	Thu,  1 Oct 2020 11:08:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24F07C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E00A841AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_PxCQLYB04P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:08:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D64EF8414F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:08:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t10so5201083wrv.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xGgEl5Rxv8pcgr4UyrtA7PKGzwKchL0MzkccOg9/VuM=;
 b=IMxRzluWyIMbkmw/ZbEJ0D5thXTj5CVcWY3mubzQ1qaobwmFU6ypfS/HGJCWtPDMk+
 f2lsHO9dfFsjg7D3A2igOLiKlWkv0md9QD7uxN8eQgNUhi+bBIOgsP9ihibdSdd4rtHX
 ccExIpZ5LbzeMRkJnUwWSi7NlHNOB04axVZAzOJI6vbsF+QerAlrASWbXtr5ScLZOXGe
 /QxxnLiC6GR5nkuNsbhCsm+dLOejjEfDgbm7WoQCVniTP/IyXJ4UTVhIOJ5uyqbQE47k
 8HgtDtf4mxLslLtwgpulfDjqrrLTZ/PxZpNHGqaBP7dg1hJad0G+t1ASlx94CSxZq2hz
 XJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xGgEl5Rxv8pcgr4UyrtA7PKGzwKchL0MzkccOg9/VuM=;
 b=Tv/Ok57e7jt0hNSmRtKWb1mKVL9uKSzVZb6JvZD0+S4ZScCcHuGT+w8j0FLETk/8PJ
 wnAvtUOxfoAQca2JFlhbKGlFWpiwEoVsMWaZM26p3Jlk35efJHj/YtfgyP4hOBIsyv1a
 V1hX31JrM1jfjQfH9M734B8Fhxa3Bk7XVl/SaCGDB8d7acj4rs+LSEGQO6KtPf4e1oo+
 6cX0XO/zUtAC3hhvw9glT/VNXY0wUaBfIcGr2ZwHzchgapcwOKXQAlHYh4Mgk8xrUKkW
 90z6nxb5MDht+46KopI0eDqpfKuRGg9A4BELDThjwQHz+FjHXyYQHdId9dsCJBcRRL4J
 bStQ==
X-Gm-Message-State: AOAM533vnzFclqmIhafsEOBuEKTm4sgjOmvcJF24CsYrZOGzBbdG9tU0
 d3K4KGw73RjJ5bW2O0lMGOuIFk4XoB/1J4kG
X-Google-Smtp-Source: ABdhPJwoRe50yHtGTMMW8hzuaFaTpWt8efjI6L0XCW3mLLGG2fAMBDgSqiidxvhKlfWRcElxij0VUw==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr8804121wrx.115.1601550529944; 
 Thu, 01 Oct 2020 04:08:49 -0700 (PDT)
Received: from felia ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id h8sm8217381wrw.68.2020.10.01.04.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:08:49 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 1 Oct 2020 13:08:47 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <61d45592-20be-7fe1-8168-5ccacca655a3@gmail.com>
Message-ID: <alpine.DEB.2.21.2010011245490.24571@felia>
References: <61d45592-20be-7fe1-8168-5ccacca655a3@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kbuild: use interpreters to
	invoke scripts
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



On Thu, 1 Oct 2020, Ujjwal Kumar wrote:

> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
> 
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  Documentation/Makefile                           | 16 ++++++++--------
>  Documentation/userspace-api/media/Makefile       |  6 +++---
>  Makefile                                         |  4 ++--
>  arch/arm64/kernel/vdso/Makefile                  |  2 +-
>  arch/arm64/kernel/vdso32/Makefile                |  2 +-
>  arch/ia64/Makefile                               |  4 ++--
>  arch/nds32/kernel/vdso/Makefile                  |  2 +-
>  .../comedi/drivers/ni_routing/tools/Makefile     |  6 +++---
>  scripts/Makefile.build                           |  2 +-
>  scripts/Makefile.package                         |  4 ++--
>  tools/bootconfig/Makefile                        |  2 +-
>  tools/bpf/Makefile.helpers                       |  2 +-
>  tools/lib/bpf/Makefile                           |  2 +-
>  tools/perf/Makefile.perf                         |  2 +-
>  tools/power/cpupower/Makefile                    |  2 +-
>  tools/testing/selftests/rcutorture/Makefile      |  2 +-
>  tools/testing/selftests/rseq/Makefile            |  2 +-
>  tools/testing/selftests/vm/Makefile              |  6 +++---
>  tools/testing/selftests/wireguard/qemu/Makefile  |  4 ++--
>  tools/testing/selftests/x86/Makefile             |  6 +++---
>  20 files changed, 39 insertions(+), 39 deletions(-)
>

You will probably need to split this patch into multiple patches, but the 
discussion will show how to split it best.

Probably:

 - one for Documentation
 - one for general kbuild, maybe including arch
 - one for selftests
 - one for the other tools
 - one for the comedi driver

So, what did you do for testing your change?

Did you check if CONFIG_SHELL is actually available in tools?


> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 6b12dd82f712..e74315074336 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -7,7 +7,7 @@ subdir- := devicetree/bindings
>  
>  # Check for broken documentation file references
>  ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
> -$(shell $(srctree)/scripts/documentation-file-ref-check --warn)
> +$(shell $(PERL) $(srctree)/scripts/documentation-file-ref-check --warn)

I guess you can drop shell, if you have added $(PERL).

>  endif
>  
>  # You can set these variables from the command line.
> @@ -29,7 +29,7 @@ ifeq ($(HAVE_SPHINX),0)
>  .DEFAULT:
>  	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
>  	@echo
> -	@$(srctree)/scripts/sphinx-pre-install
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install
>  	@echo "  SKIP    Sphinx $@ target."
>  
>  else # HAVE_SPHINX
> @@ -78,14 +78,14 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>  	$(abspath $(BUILDDIR)/$3/$4)
>  
>  htmldocs:
> -	@$(srctree)/scripts/sphinx-pre-install --version-check
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>  
>  linkcheckdocs:
>  	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
>  
>  latexdocs:
> -	@$(srctree)/scripts/sphinx-pre-install --version-check
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
>  
>  ifeq ($(HAVE_PDFLATEX),0)
> @@ -97,7 +97,7 @@ pdfdocs:
>  else # HAVE_PDFLATEX
>  
>  pdfdocs: latexdocs
> -	@$(srctree)/scripts/sphinx-pre-install --version-check
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>  	$(foreach var,$(SPHINXDIRS), \
>  	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit; \
>  	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
> @@ -107,11 +107,11 @@ pdfdocs: latexdocs
>  endif # HAVE_PDFLATEX
>  
>  epubdocs:
> -	@$(srctree)/scripts/sphinx-pre-install --version-check
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
>  
>  xmldocs:
> -	@$(srctree)/scripts/sphinx-pre-install --version-check
> +	@$(PERL) $(srctree)/scripts/sphinx-pre-install --version-check
>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
>  
>  endif # HAVE_SPHINX
> @@ -120,7 +120,7 @@ endif # HAVE_SPHINX
>  # work or silently pass without Sphinx.
>  
>  refcheckdocs:
> -	$(Q)cd $(srctree);scripts/documentation-file-ref-check
> +	$(Q)cd $(srctree);$(PERL) scripts/documentation-file-ref-check
>  
>  cleandocs:
>  	$(Q)rm -rf $(BUILDDIR)
> diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
> index 81a4a1a53bce..5919b3e749fe 100644
> --- a/Documentation/userspace-api/media/Makefile
> +++ b/Documentation/userspace-api/media/Makefile
> @@ -13,11 +13,11 @@ FILES = audio.h.rst ca.h.rst dmx.h.rst frontend.h.rst net.h.rst video.h.rst \
>  TARGETS := $(addprefix $(BUILDDIR)/, $(FILES))
>  
>  gen_rst = \
> -	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
> -	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
> +	echo $(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
> +	$(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>  
>  quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
> -	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
> +	$(PERL) ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>  
>  silent_gen_rst = ${gen_rst}
>  
> diff --git a/Makefile b/Makefile
> index f93dbae71248..5f1399a576d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1258,7 +1258,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>  PHONY += headerdep
>  headerdep:
>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>  
>  # ---------------------------------------------------------------------------
>  # Kernel headers
> @@ -1314,7 +1314,7 @@ PHONY += kselftest-merge
>  kselftest-merge:
>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  
>  # ---------------------------------------------------------------------------
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index de981f7b4546..30fe93bb5488 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>  
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>  	$(call if_changed,vdsosym)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 572475b7b7ed..4f8fe34bc75a 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
>  # The AArch64 nm should be able to read an AArch32 binary
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>  
>  # Install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL32 $@
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 2876a7df1b0a..3e97ad2235d2 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -28,8 +28,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>  
> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>

That is duplicate. Drop shell.
  
>  ifeq ($(GAS_STATUS),buggy)
>  $(error Sorry, you need a newer version of the assember, one that is built from	\
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
> index 55df25ef0057..e77d4bcfa7c1 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>

I guess it is better to modify gen-vdsosym.

  
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>  	$(call if_changed,vdsosym)
> diff --git a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
> index 6e92a06a44cb..1d4635320fdb 100644
> --- a/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
> +++ b/drivers/staging/comedi/drivers/ni_routing/tools/Makefile
> @@ -42,14 +42,14 @@ ni_values.py: convert_c_to_py
>  	./convert_c_to_py
>  
>  csv-files : ni_values.py comedi_h.py
> -	./convert_py_to_csv.py
> +	$(PYTHON3) ./convert_py_to_csv.py
>  
>  csv-blank :
> -	./make_blank_csv.py
> +	$(PYTHON3) ./make_blank_csv.py
>  	@echo New blank csv signal table in csv/blank_route_table.csv
>  
>  c-files : comedi_h.py
> -	./convert_csv_to_c.py --route_values --device_routes
> +	$(PYTHON3) ./convert_csv_to_c.py --route_values --device_routes
>  
>  ROUTE_VALUES_SRC=$(wildcard ../ni_route_values/*.c)
>  DEVICE_ROUTES_SRC=$(wildcard ../ni_device_routes/*.c)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a467b9323442..893217ee4a17 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -104,7 +104,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
>  
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
> +  cmd_checkdoc = $(PERL) $(srctree)/scripts/kernel-doc -none $<
>  endif
>  
>  # Compile C sources (.c)
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index f952fb64789d..4fc16c4776cc 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -44,7 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>  	echo >&2; \
>  	false; \
>  fi ; \
> -$(srctree)/scripts/setlocalversion --save-scmversion; \
> +$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion; \
>  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
> @@ -123,7 +123,7 @@ git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
>  mkdir -p $(perf-tar);                                               \
>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>  (cd $(srctree)/tools/perf;                                          \
> -util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
> +$(CONFIG_SHELL) util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index da5975775337..b6aee03a6ca9 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -21,7 +21,7 @@ $(OUTPUT)bootconfig: main.c $(LIBSRC)
>  	$(CC) $(filter %.c,$^) $(CFLAGS) -o $@
>  
>  test: $(ALL_PROGRAMS) test-bootconfig.sh
> -	./test-bootconfig.sh $(OUTPUT)
> +	$(CONFIG_SHELL) ./test-bootconfig.sh $(OUTPUT)
>  
>  install: $(ALL_PROGRAMS)
>  	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
> diff --git a/tools/bpf/Makefile.helpers b/tools/bpf/Makefile.helpers
> index 854d084026dd..6f2b042ff719 100644
> --- a/tools/bpf/Makefile.helpers
> +++ b/tools/bpf/Makefile.helpers
> @@ -35,7 +35,7 @@ man7: $(DOC_MAN7)
>  RST2MAN_DEP := $(shell command -v rst2man 2>/dev/null)
>  
>  $(OUTPUT)$(HELPERS_RST): $(UP2DIR)../../include/uapi/linux/bpf.h
> -	$(QUIET_GEN)$(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
> +	$(QUIET_GEN)$(PYTHON3) $(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
>  
>  $(OUTPUT)%.7: $(OUTPUT)%.rst
>  ifndef RST2MAN_DEP
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index f43249696d9f..8a3f7399568f 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -179,7 +179,7 @@ $(BPF_IN_STATIC): force elfdep zdep bpfdep $(BPF_HELPER_DEFS)
>  	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
>  
>  $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
> -	$(QUIET_GEN)$(srctree)/scripts/bpf_helpers_doc.py --header \
> +	$(QUIET_GEN)$(PYTHON3) $(srctree)/scripts/bpf_helpers_doc.py --header \
>  		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
>  
>  $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 6031167939ae..42f797e541d0 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -229,7 +229,7 @@ goals := $(filter-out all sub-make, $(MAKECMDGOALS))
>  $(goals) all: sub-make
>  
>  sub-make: fixdep
> -	@./check-headers.sh
> +	$(Q)$(SHELL) ./check-headers.sh
>  	$(Q)$(MAKE) FIXDEP=1 -f Makefile.perf $(goals)
>  
>  else # force_fixdep
> diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
> index c7bcddbd486d..b683e774f5e3 100644
> --- a/tools/power/cpupower/Makefile
> +++ b/tools/power/cpupower/Makefile
> @@ -51,7 +51,7 @@ DESTDIR ?=
>  # Package-related definitions. Distributions can modify the version
>  # and _should_ modify the PACKAGE_BUGREPORT definition
>  
> -VERSION:=			$(shell ./utils/version-gen.sh)
> +VERSION:=			$(shell $(CONFIG_SHELL) ./utils/version-gen.sh)

Duplicate shell.

>  LIB_MAJ=			0.0.1
>  LIB_MIN=			0
>  
> diff --git a/tools/testing/selftests/rcutorture/Makefile b/tools/testing/selftests/rcutorture/Makefile
> index 5202dc666206..011a6990e8ac 100644
> --- a/tools/testing/selftests/rcutorture/Makefile
> +++ b/tools/testing/selftests/rcutorture/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0+
>  all:
> -	( cd ../../../..; tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
> +	( cd ../../../..; $(CONFIG_SHELL) tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
> index 2af9d39a9716..6b0ae924cc7e 100644
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -17,7 +17,7 @@ TEST_GEN_PROGS = basic_test basic_percpu_ops_test param_test \
>  
>  TEST_GEN_PROGS_EXTENDED = librseq.so
>  
> -TEST_PROGS = run_param_test.sh
> +TEST_PROGS = $(CONFIG_SHELL) run_param_test.sh
>  
>  TEST_FILES := settings
>  
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index 30873b19d04b..a67a19a36cde 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -40,9 +40,9 @@ TEST_GEN_FILES += userfaultfd
>  TEST_GEN_FILES += khugepaged
>  
>  ifeq ($(ARCH),x86_64)
> -CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
> -CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
> -CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
> +CAN_BUILD_I386 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
> +CAN_BUILD_X86_64 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
> +CAN_BUILD_WITH_NOPIE := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
>  
>  TARGETS := protection_keys
>  BINARIES_32 := $(TARGETS:%=%_32)
> diff --git a/tools/testing/selftests/wireguard/qemu/Makefile b/tools/testing/selftests/wireguard/qemu/Makefile
> index 4bdd6c1a19d3..d24f3efb2633 100644
> --- a/tools/testing/selftests/wireguard/qemu/Makefile
> +++ b/tools/testing/selftests/wireguard/qemu/Makefile
> @@ -255,8 +255,8 @@ $(KERNEL_BUILD_PATH)/.config: kernel.config arch/$(ARCH).config
>  	printf 'CONFIG_NR_CPUS=$(NR_CPUS)\nCONFIG_INITRAMFS_SOURCE="$(BUILD_PATH)/init-cpio-spec.txt"\n' >> $(KERNEL_BUILD_PATH)/minimal.config
>  	cat arch/$(ARCH).config >> $(KERNEL_BUILD_PATH)/minimal.config
>  	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) allnoconfig
> -	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
> -	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
> +	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
> +	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
>  
>  $(KERNEL_BZIMAGE): $(KERNEL_BUILD_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(MUSL_PATH)/lib/libc.so $(IPERF_PATH)/src/iperf3 $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/misc/ss $(IPROUTE2_PATH)/ip/ip $(IPTABLES_PATH)/iptables/xtables-legacy-multi $(NMAP_PATH)/ncat/ncat $(WIREGUARD_TOOLS_PATH)/src/wg $(BUILD_PATH)/init ../netns.sh $(WIREGUARD_SOURCES)
>  	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 6703c7906b71..eb2c1025def0 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -6,9 +6,9 @@ include ../lib.mk
>  .PHONY: all all_32 all_64 warn_32bit_failure clean
>  
>  UNAME_M := $(shell uname -m)
> -CAN_BUILD_I386 := $(shell ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
> -CAN_BUILD_X86_64 := $(shell ./check_cc.sh $(CC) trivial_64bit_program.c)
> -CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh $(CC) trivial_program.c -no-pie)
> +CAN_BUILD_I386 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
> +CAN_BUILD_X86_64 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_64bit_program.c)
> +CAN_BUILD_WITH_NOPIE := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_program.c -no-pie)
>  
>  TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
>  			check_initial_reg_state sigreturn iopl ioperm \
> -- 
> 2.26.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
