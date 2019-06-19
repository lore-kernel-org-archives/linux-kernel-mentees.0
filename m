From: helgaas at kernel.org (Bjorn Helgaas)
Date: Wed, 19 Jun 2019 14:44:40 -0500
Subject: [Linux-kernel-mentees] [PATCH v4 0/3] lspci: Update verbose
	help and show_range()
In-Reply-To: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
References: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
Message-ID: <20190619194440.GA189077@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jun 19, 2019 at 10:48:55AM -0600, Kelsey Skunberg wrote:
> Changes since v1:
>   - Expand changes into more patches for easier review.
>   - Combine three patches for lspci.c into patchset.
> 
>   * Patch 1: lspci: Include -vvv option in help
>     No changes made. Added to series for review.
> 
>   * Patch 2: lspci: Remove unnecessary !verbose check in show_range()
>     Move into it's own patch since v1. Dead code which checks for
>     verbosity to be true.
> 
>   * Patch 3: lspci: Replace output for bridge with empty range from
>     "None" to "[empty]"
>     Patch builds off Patch 2 to change show_range() output to be more
>     consistent between each level of verbosity.
> 
> Changes since v2:
>   * Patch 1: Update commit log to imperative mood
> 
>   * Patch 2: Fix logical error
>         Previous:
>         (base > limit || verbose < 3)
>         New:
>         (base > limit && verbose < 3)
> 
>   * Patch 3: Fix logical error
>         Previous:
>         base > limit
>         New:
>         base <= limit
> 
> Changes since v3:
>   * Patch 1 and 2: No change
>   * Patch 3: Change output from "[empty]" to "[disabled]"
> 
> Kelsey Skunberg (3):
>   lspci: Include -vvv option in help
>   lspci: Remove unnecessary !verbose check in show_range()
>   lspci: Change output for bridge with empty range to "[disabled]"
> 
>  lspci.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)

These look great to me, thanks for doing this.  FWIW:

Reviewed-by: Bjorn Helgaas <bhelgaas at google.com>
